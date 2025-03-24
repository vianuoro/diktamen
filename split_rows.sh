#!/bin/bash
# Define input text file
INPUT_FILE=$1
# Ensure input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: Input file '$INPUT_FILE' not found!"
    exit 1
fi
# Step 1: Substitute commas with "komma" and newlines with "ny rad"
processed_text=$(sed 's/,/ komma /g' "$INPUT_FILE")  # Replace commas with "komma"
processed_text=$(echo "$processed_text" | sed ':a;N;$!ba;s/\n/ nyrad /g')  # Replace newlines with "ny rad"
# Step 2: Split sentences that end with a period
# Replace period followed by a space or end of the string with a new line
processed_text=$(echo "$processed_text" | sed 's/\.\s*/ punkt nyrad /g')
# Step 3: Output each sentence as a standalone line
echo "$processed_text" | sed 's/ nyrad /\'$'\n/g'
