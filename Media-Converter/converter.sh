#!/bin/bash

cd ~
cd D:/
ls

# The script will need to replace spaces in each of the file and folder names such that the script doesn't break.
find . -depth -name '* *' \
| while IFS=' ' read -r f ; do mv -i "$f" "$(dirname "$f")/$(basename "$f"|tr ' ' _)" ; done

# List the items that will be converted
find Movies2/ -maxdepth 4 -name "*.avi"  -execdir ls \;

# Convert the files. This appears to convert the system within the avi and mkv containers.
# find Movies2/ -maxdepth 4 -name '*.avi' -exec bash -c 'ffmpeg -i $0 ${0/avi/mkv}' {} \;

# This will simply copy the video and audio bitstream without quality loss. It simply changes the container.
find Movies2/ -maxdepth 4 -name '*.avi' -exec -c 'ffmpeg -i $0 -c:v copy -c:a copy ${0/avi/mkv}' {} \;

# Delete the old file.
find Movies2/ -maxdepth 4 -f '*.avi' -exec rm -f {} \;

