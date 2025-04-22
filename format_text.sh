#!/bin/bash

# Ensure a file is provided
if [ $# -ne 1 ]; then
  echo "Användning: $0 <filnamn>"
  exit 1
fi

input_file="$1"

# Define punctuation replacements
declare -A replacements=(
  ["\\."]="punkt"
  [","]="kommatecken"
  ["!"]="utropstecken"
  ["\\?"]="frågetecken"
  [":"]="kolon"
  [";"]="semikolon"
  ['"']="citationstecken"
  ["'"]="apostrof"
  ["-"]="talstreck"
  ["\\("]="vänsterparentes"
  ["\\)"]="högerparentes"
)

# Read file content
text=$(cat "$input_file")

# Replace punctuation with their respective names
for punc in "${!replacements[@]}"; do
  text=$(echo "$text" | sed -E "s/$punc/ ${replacements[$punc]}/g")
done

# Replace newlines with "ny rad"
text=$(echo "$text" | sed ':a;N;$!ba;s/\n/ nyrad /g')

# Split sentences into separate lines (assuming they end with 'punkt', 'frågetecken', or 'utropstecken')
text=$(echo "$text" | sed -E 's/(punkt( punkt)*) /\1\n/g')

# Output the modified text
echo "$text"

