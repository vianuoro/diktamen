#!/bin/bash
python3 python/diktamen.py "$1" output.mp3 --rate -60
echo "saving file mp3_files/$2.mp3"
sox output.mp3 mp3_files/$2.mp3 pad 2
rm *.mp3