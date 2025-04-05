# diktamen
diktamen till Anna 😀 

Python3 environment:
pip3 install virtualenv
python3 source newenv/bin/activate
virtualenv venv -p python --system-site-packages
source venv/bin/activate

Packages to install in your virtualenv: mpv cox ffmpeg

Usage:
- paste your text in file text.txt
- create the file contatining separate row by sentence with command:
  ./format_text.sh text.txt > lines.txt
  Note: not all the grammatical cases are covered, reviewing the generated
  file "lines.txt" is advised
- play the diktamen with ./run2.0.sh
- the script run.2.0 saves an "mp3_files/output.mp3" file too
