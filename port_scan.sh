#!/bin/bash

# This code scan open port of a IP
#
# Example of use:
#     ./port_scan.sh 127.0.0.1

function ctrl_c() {
  echo -e "\n\n[!] Exiting..\n"
  wait
  tput cnorm
  exit 1
}

# Ctrl + C 

trap ctrl_c INT 

# Hide cursor
tput civis

# Filter IP
if [ ! -z "$1" ]
then
  ip_format="^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$"
  if [[ $1 =~ $ip_format ]]
  then
    ip="$1"
  else
    echo -e "[!] Error. Invalid IP."
    echo -e "\tExample of use: ./port_scan.sh 127.0.0.1"
    tput cnorm
    exit 1
  fi
fi


for port in $(seq 65535)
do 

  (echo '' > /dev/tcp/$ip/$port) 2>/dev/null && echo "[+] Open port: $port" & 

done
wait

# Reveal cursor
tput cnorm

exit 0
