#!/bin/bash

convertMovies () {
    # Movies

    # The script will need to replace spaces in each of the file and folder names such that the script doesn't break (https://stackoverflow.com/questions/2709458/how-to-replace-spaces-in-file-names-using-a-bash-script).
    find . -depth -name '* *' \
    | while IFS=' ' read -r f ; do mv -i "$f" "$(dirname "$f")/$(basename "$f"|tr ' ' _)" ; done

    # List the items that will be converted
    find Movies2/ -maxdepth 4 -name "*.avi"  -execdir ls \;

    # Convert the files. This appears to convert the system within the avi and mkv containers (https://stackoverflow.com/questions/20496798/command-find-and-convert-using-ffmpeg).
    # find Movies2/ -maxdepth 4 -name '*.avi' -exec bash -c 'ffmpeg -i $0 ${0/avi/mkv}' {} \;

    # This will simply copy the video and audio bitstream without quality loss. It simply changes the container (https://superuser.com/questions/227338/how-to-convert-an-mkv-to-avi-with-minimal-loss).
    find Movies/ -maxdepth 4 -name '*.avi' -exec -c 'ffmpeg -i $0 -c:v copy -c:a copy ${0/avi/mkv}' {} \;

    # Delete the old file.
    find Movies/ -maxdepth 4 -f '*.avi' -exec rm -f {} \;

}

convertSeries () {

    # Series

    # List the items that will be converted
    find Series/ -maxdepth 4 -name "*.avi"  -execdir ls \;

    # Convert the files. This appears to convert the system within the avi and mkv containers (https://stackoverflow.com/questions/20496798/command-find-and-convert-using-ffmpeg).
    # find Movies2/ -maxdepth 4 -name '*.avi' -exec bash -c 'ffmpeg -i $0 ${0/avi/mkv}' {} \;

    # This will simply copy the video and audio bitstream without quality loss. It simply changes the container (https://superuser.com/questions/227338/how-to-convert-an-mkv-to-avi-with-minimal-loss).
    find Series/ -maxdepth 4 -name '*.avi' -exec -c 'ffmpeg -i $0 -c:v copy -c:a copy ${0/avi/mkv}' {} \;

    # Delete the old file.
    find Series/ -maxdepth 4 -f '*.avi' -exec rm -f {} \;

}

cd ~
cd D:/
ls
convertMovies
convertSeries

cd ~
cd E:/Media
ls
convertMovies
convertSeries

cd ~
cd G:
ls
convertMovies
convertSeries

cd ~
K:/Media
ls
convertSeries

cd ~
cd L:
ls
convertMovies
convertSeries