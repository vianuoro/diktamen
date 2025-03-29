rm *.mp3
while IFS= read -r line; do 
        wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$line&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
        ffmpeg -i *.mp3 -filter:a "atempo=0.8" file_0.8.mp3
	mpv file_0.8.mp3;
        rm *.mp3;
        for i in $line; do
            rm *.mp3;
            wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$i&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
            ffmpeg -i *.mp3 -filter:a "atempo=0.8" file_0.8.mp3
            mpv file_0.8.mp3;
	    sleep 2;
	done;
	rm *.mp3;
        wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$line&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
        ffmpeg -i *.mp3 -filter:a "atempo=0.5" file_0.5.mp3
        mpv file_0.5.mp3;
        rm *.mp3;
done < lines.txt
