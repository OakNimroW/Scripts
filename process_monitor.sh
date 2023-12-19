#!/bin/bash

ctrl_c () {
  echo -e "\n\n[!] Exiting...\n"
  tput cnorm
  exit 0
}

# Ctrl + C
trap ctrl_c INT

# Hide Cursor
tput civis

# Add filter
if [ $# -ne 1 -o -z $1 ] 
then
  echo -e "\n[!] Usage. $0 text-to-filter-with-grep"
  echo -e "[!] Example:\n\t$0 \"command|kworker\"\n\n"
  tput cnorm
  exit 1
fi

old_process=$(ps -eo pid,user,command)

filter=$1

while true
do

  new_process=$(ps -eo pid,user,command)

  diff <(echo "$old_process") <(echo "$new_process") | grep -E "[\>\<]" | grep -vE "${filter}"

  old_process=$new_process

done

