#!/usr/bin/env python3

"""Manage Taskwarrior notes"""

import argparse
import logging
import os
import sys
import time
import numpy as np

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
    task_tag_list = []
    if task_tags != "":
        task_tag_list = task_tags.split(",")
    tag_lines = "\n"
    for t in task_tag_list:
        tag_lines += f'<mark><span class="tag">*{t}*</mark>\n'
    tag_lines += "\n"

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
            f.write(tag_lines)
            f.write(f"\n[comment]: end_tags\n")
            f.write(f"\n\n")
            f.write(f"------------------------------------------------\n")
            f.write(f"# {task_description}")
            f.write(f"------------------------------------------------\n")
            f.write(f"\n\n")
            f.write(f"\n[comment]: begin_notes\n")
            f.write(f"\n\n###### {current_date}\n\n")
            f.flush()
    else:
        with open(notes_file, "r") as f:
            contents = f.readlines()

        index = 0

        tag_index_list = []
        for index, line in enumerate(contents):
            if "[comment]: begin_tags" in line:
                tag_index_list.append(index)
            if "[comment]: end_tags" in line:
                tag_index_list.append(index)

        oldtagrange = []
        if len(tag_index_list) > 1:
            oldtagrange = list(range(tag_index_list[0] + 1, tag_index_list[1]))

        idxrange = list(range(0, len(contents)))
        valididxrange = np.setdiff1d(idxrange, oldtagrange)
        contents = [contents[idx] for idx in valididxrange]

        contents.insert(tag_index_list[0] + 1, tag_lines)

        comment_index_list = []
        for index, line in enumerate(contents):
            if "###### [WW" in line:
                comment_index_list.append(index)
        comment_index_list.append(len(contents))

        validblock = False
        if len(comment_index_list) > 1:
            for ln in range(comment_index_list[0] + 1, comment_index_list[1]):
                if contents[ln] != "\n":
                    validblock = True
                    break

        invalidrange = []
        if not validblock:
            if len(comment_index_list) > 1:
                invalidrange = list(range(comment_index_list[0], comment_index_list[1]))

        idxrange = list(range(0, len(contents)))
        valididxrange = np.setdiff1d(idxrange, invalidrange)
        contents = [contents[idx] for idx in valididxrange]

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
