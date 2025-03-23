while IFS= read -r line; do 
	wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$line&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
	ffplay -autoexit -t '231' *.mp3;
	rm *.mp3; 
	for i in $line; do
		rm *.mp3;
		wget $(curl -s 'https://ttsmp3.com/makemp3_new.php' --data-raw "msg=$i&lang=Astrid&source=ttsmp3" | jq -r '.URL' | sed 's/\\//g');
		ffplay -autoexit -t '231' -af "atempo=0.6" *.mp3; sleep 2;
	done;
done < lines.txt
