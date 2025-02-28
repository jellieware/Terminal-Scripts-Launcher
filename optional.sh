 #!/data/data/com.termux/files/usr/bin/bash
myarray=()
myopts=()
opts=0
myoption=""
# Specify the directory to loop through
directory="/storage/emulated/0/Documents/scriptsxxx"

while [[ ${myoption} != "q" ]]; do

    printf "\033c"
    clear
#ascii-image-converter /storage/emulated/0/Documents/bashwrap.png -W 36 -C -c
echo -e "\e[38;5;118m#!BASH Script Launcher\e[38;5;231m"
echo ""
echo -e "\e[38;5;244m "
shuf -n 1 /storage/emulated/0/Documents/scriptsxxx/quotesfxz.txt
echo -e "\e[38;5;231m"    
echo ""
# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Error: Directory not found: $directory"
  exit 1
fi

# Loop through files in the directory
for file in "$directory"/*; do
  # Check if the item is a regular file (not a directory)
  if [ -f "$file" ]; then
  if [[ "$file" == *.sh ]]; then
    # Extract and print the filename
    filename=$(basename "$file")
    myarray+=("$filename")
    myopts+=("$opts")
    echo -e "	\e[38;5;119m$opts\e[38;5;231m" : "$filename"
    ((opts++))
  fi
  fi
done
echo " "
read -p "Choice: " myoption
echo " "
if [[  " ${myopts[@]} " =~ " ${myoption} " ]]; then
 opts=0
 cd $directory 
 bash ${myarray[myoption]}
fi
if [[ ${myoption} == "q" ]]; then
  exit
fi
if [[ ! " ${myopts[@]} " =~ " ${myoption} " ]]; then
opts=0
fi
done

