rm *.mp3
while IFS= read -r line; do 
        wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$line&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
        mpv *.mp3;
        rm --speed=0.9 --ao=pulse *.mp3; 
        for i in $line; do
            rm *.mp3;
            wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$i&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
            mpv --speed=0.7 --ao=pulse *.mp3; sleep 1;
	done;
	rm *.mp3;
	wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$line&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
	mpv --speed=0.7 --ao=pulse *.mp3;
	rm *.mp3;
done < lines.txt
