#!/bin/bash

: '

I added this 5 lines in my .zshrc

# TO-DO List
if [ -f /home/oaknimrow/TODO-List.txt -a -f /opt/Shell-TODO-List/shell-TODO-List.sh ]
then
    source /opt/Shell-TODO-List/shell-TODO-List.sh
fi

====================================================

TO-DO file structure
[priority] TODO Description or name idk waht u want
[1] todo 1
[2] todo 2
[3] todo 3

'


#Colors
greenColor="\e[0;32m\033[1m"
endColor="\033[0m\e[0m"
redColor="\e[0;31m\033[1m"
blueColor="\e[0;34m\033[1m"
yellowColor="\e[0;33m\033[1m"
purpleColor="\e[0;35m\033[1m"
turquoiseColor="\e[0;36m\033[1m"
grayColor="\e[0;37m\033[1m"

# TO-DO File
file="/home/oaknimrow/TODO-List.txt"

# Empty TO-DO List
if [ -s $file ]; then

  # Banner
  echo -e -n "${purpleColor}\tTO-DO LIST${endColor}\n"
  
  while read line
  do

    if [ -z "$line" ]
    then
      continue
    fi
  
    declare -i number=$(echo $line | /usr/bin/tr -d "[&]" | /usr/bin/awk '{print $1}')
  
    if [ $number -eq 1 ]
    then
  
      echo -n -e "${redColor}[$number]${endColor} " && /usr/bin/bat --language=txt --style=plain --paging=never <(echo "$line" | /usr/bin/awk '{$1=""; $1=$1; sub(/^ */, ""); print}')
  
    elif [ $number -eq 2 ]
    then
  
      echo -n -e "${yellowColor}[$number]${endColor} " && /usr/bin/bat --language=txt --style=plain --paging=never <(echo "$line" | /usr/bin/awk '{$1=""; $1=$1; sub(/^ */, ""); print}')
  
    elif [ $number -eq 3 ]
    then
  
      echo -n -e "${turquoiseColor}[$number]${endColor} " && /usr/bin/bat --language=txt --style=plain --paging=never <(echo "$line" | /usr/bin/awk '{$1=""; $1=$1; sub(/^ */, ""); print}')
  
    elif [ $number -eq 4 ]
    then
  
      echo -n -e "${purpleColor}[$number]${endColor} " && /usr/bin/bat --language=txt --style=plain --paging=never <(echo "$line" | /usr/bin/awk '{$1=""; $1=$1; sub(/^ */, ""); print}')
  
    elif [ $number -eq 5 ]
    then
  
      echo -n -e "${blueColor}[$number]${endColor} " && /usr/bin/bat --language=txt --style=plain --paging=never <(echo "$line" | /usr/bin/awk '{$1=""; $1=$1; sub(/^ */, ""); print}')
  
    else
  
      echo -n -e "${grayColor}[$number]${endColor} " && /usr/bin/bat --language=txt --style=plain --paging=never <(echo "$line" | /usr/bin/awk '{$1=""; $1=$1; sub(/^ */, ""); print}')
  
    fi
  
  	echo ""
  
  done < "$file"

fi
