#!/usr/bin/env python3

"""Manage Taskwarrior notes"""

import argparse
import logging
import os
import sys
import time

NOTES_DIR = "~/.notes/.taskwarriornotes"
EDITOR = os.environ["EDITOR"]

logging.basicConfig(level=logging.DEBUG)


def write_note(task_id: int):
    """Open `$EDITOR` to take notes about task with ID `task_id`."""
    task_uuid = os.popen(f"task _get {task_id}.uuid").read().rstrip()
    task_uuid_short = task_uuid.split("-")[0]

    if not task_uuid:
        logging.error(f"{task_id} has no UUID!")
        sys.exit(1)

    logging.debug(f"Task {task_id} has UUID {task_uuid}")

    notes_dir = os.path.expanduser(NOTES_DIR)
    os.makedirs(notes_dir, exist_ok=True)
    notes_basename = f"{task_uuid}.md"
    notes_file = os.path.join(notes_dir, notes_basename)
    logging.debug(f"Notes file is {notes_file}")

    t = time.localtime()
    current_date = time.strftime("[WW%W] %a %l:%M%p %Z on %b %d, %Y", t)

    if not os.path.exists(notes_file):
        logging.info("Adding description to empty notes file")
        task_description = os.popen(f"task _get {task_id}.description").read()

        with open(notes_file, "w") as f:
            f.write(f"# {task_description}\n")
            f.write(f"> id: **{task_id}** uuid: **{task_uuid_short}**")
            f.write(f"\n\n###### {current_date}\n\n\n")
            f.flush()
    else:
        with open(notes_file, "a") as f:
            f.write(f"\n\n###### {current_date}\n\n\n")

    os.execlp(EDITOR, EDITOR, notes_file)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Write Taskwarrior notes")
    parser.add_argument(
        "task_id", metavar="ID", type=int, help="ID of the task to note"
    )
    args = parser.parse_args()

    write_note(args.task_id)
