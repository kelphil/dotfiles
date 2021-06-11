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

styledef = """<style>
mark{
    background: red;
    border-radius:20px;
}
.tag{
    margin: 15px;
}
</style>
"""


def write_note(task_id):
    """Open `$EDITOR` to take notes about task with ID `task_id`."""
    task_uuid = os.popen(f"task _get {task_id}.uuid").read().rstrip()
    task_uuid_short = task_uuid.split("-")[0]
    task_tags = os.popen(f"task _get {task_id}.tags").read().rstrip()
    task_tag_list = task_tags.split(",")

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
            f.write(styledef)
            f.write(f"> id: **{task_id}** uuid: **{task_uuid_short}**\n")
            f.write(f"\n[comment]: begin_tags\n\n")
            for t in task_tag_list:
                f.write(f'<mark><span class="tag">*{t}*</mark>\n')
            f.write(f"\n[comment]: end_tags\n")
            f.write(f"\n\n# {task_description}\n")
            f.write(f"\n[comment]: begin_notes\n")
            f.write(f"\n\n###### {current_date}\n\n")
            f.flush()
    else:
        with open(notes_file, "r") as f:
            contents = f.readlines()

        index = 0
        for index, line in enumerate(contents):
            if "[comment]: begin_notes" in line:
                break

        value = f"\n\n###### {current_date}\n\n\n"

        contents.insert(index + 1, value)

        with open(notes_file, "w") as f:
            contents = "".join(contents)
            f.write(contents)

    os.execlp(EDITOR, EDITOR, notes_file)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Write Taskwarrior Notes")
    parser.add_argument(
        "task_id", metavar="id", type=str, help="Task ID"
    )
    args = parser.parse_args()

    write_note(args.task_id)
