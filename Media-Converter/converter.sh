#!/bin/bash

cd ~
cd D:/
ls

# This will list the files in the folder where there are avi files present.
find Movies2/ -maxdepth 4 -name "*.avi"  -execdir ls \;

find Movies2/ -maxdepth 4 -name '*.avi' -exec bash -c 'ffmpeg -i $0 -vcodec copy -acodec copy  ${0/avi/mkv}' {} \;



# for i in *.avi;
#     do name=`echo "$i" | cut -d'.' -f1`
#     echo "$name"
# #     # ffmpeg -i "$i" "${name}.mp4"
# done