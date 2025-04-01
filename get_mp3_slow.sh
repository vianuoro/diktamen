#!/bin/bash
wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$1&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g')
ffmpeg -i *.mp3 -filter:a "atempo=0.5" file_0.5.mp3
echo "saving file mp3_files/$2.mp3"
sox file_0.5.mp3 mp3_files/$2.mp3 pad 4
rm *.mp3
