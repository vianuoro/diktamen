#!/bin/bash
rm *.mp3
IFS=$'\n' read -d '' -r -a lines < lines.txt
index=0
for i in "${lines[@]}"; do 
    echo "line $index --> $i"
    bash get_mp3.sh "$i" $index
    index=$(($index+1))
    for j in $i; do
        echo "word $index"
        bash get_mp3.sh $j $index
        index=$(($index+1))
    done;
    echo "line slow $index --> $i"
    bash get_mp3_slow.sh "$i" $index
    index=$(($index+1))
done

cd mp3_files
ls -v *.mp3 | awk '{print "file \x27"$0"\x27"}' > file_list.txt
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output.mp3
mpv output.mp3