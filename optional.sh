#!/bin/bash
myarray=()
myopts=()
opts=0
# Specify the directory to loop through
directory="/storage/emulated/0/Documents/scriptsxxx"

    printf "\033c"
    clear
    
# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Error: Directory not found: $directory"
  exit 1
fi

# Loop through files in the directory
for file in "$directory"/*; do
  # Check if the item is a regular file (not a directory)
  if [ -f "$file" ]; then
    # Extract and print the filename
    filename=$(basename "$file")
    myarray+=("$filename")
    myopts+=("$opts")
    echo "$opts" : "$filename"
    ((opts++))
  fi
done

read -p "Choice: " myoption

if [[ ! " ${myopts[@]} " =~ " ${myoption} " ]]; then
  exit
else
 cd $directory 
 bash ${myarray[myoption]}
fi


