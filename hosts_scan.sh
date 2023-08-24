#!/bin/bash

# This code scan localnet with ping
#
# Example of uses:
#     ./hosts_scan.sh 
#     ./hosts_scan.sh IP
#     ./hosts_scan.sh 192.168.0.1/24
#     ./hosts_scan.sh 172.17.0.1/16
#     ./hosts_scan.sh 10.0.0.1/8

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

# Get IP
if [ -z "$1" ]
then
  ip="$( ( /usr/sbin/ifconfig enp2s0 && /usr/sbin/ifconfig wlp3s0 ) | grep "inet " | awk '{print $2}' | tr '.' ' ') 24"
  if [ -z "$ip" ]
  then
    echo -e "[!] Error. Valid IP not found."
    tput cnorm
    exit 1
  fi
else
  ip_format="^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}$"
  if [[ $1 =~ $ip_format ]]
  then
    ip="$( echo $1 | tr '.' ' ' | tr '/' ' ' )"
  else
    echo -e "[!] Error. Unknown IP format."
    tput cnorm
    exit 1
  fi
fi

ip_1="$(echo $ip | awk '{print $1}')"
ip_2="$(echo $ip | awk '{print $2}')"
ip_3="$(echo $ip | awk '{print $3}')"
ip_4="$(echo $ip | awk '{print $4}')"
ip_5="$(echo $ip | awk '{print $5}')"

# Scan By SubnetMask
if [ "$ip_5" -eq 24 ] 
then
  echo -e "\n\t[*] Scanning Host: $ip_1.$ip_2.$ip_3.$ip_4/$ip_5\n"
  for i in $(seq 254)
  do
    timeout 2 bash -c "ping -c 1 $ip_1.$ip_2.$ip_3.$i &>/dev/null" && echo "[+] Host is up - $ip_1.$ip_2.$ip_3.$i" &
  done
elif [ "$ip_5" -eq 16 ]
then
  echo -e "\n\t[*] Scanning Host: $ip_1.$ip_2.$ip_3.$ip_4/$ip_5\n"
  for j in $(seq 254)
  do
    for i in $(seq 254)
    do 
      timeout 2 bash -c "ping -c 1 $ip_1.$ip_2.$j.$i &>/dev/null" && echo "[+] Host is up - $ip_1.$ip_2.$j.$i" &
    done
  done
elif [ "$ip_5" -eq 8 ]
then
  echo -e "\n\t[*] Scanning Host: $ip_1.$ip_2.$ip_3.$ip_4/$ip_5\n"
  for k in $(seq 254)
  do
    for j in $(seq 254)
    do
      for i in $(seq 254)
      do 
        timeout 2 bash -c "ping -c 1 $ip_1.$k.$j.$i &>/dev/null" && echo "[+] Host is up - $ip_1.$k.$j.$i" & 
      done
    done
  done
else
  echo -e "[!] Unknown Subnet Mask. Use /8, /16 or /24"
fi
wait

# Reveal cursor
tput cnorm

exit 0
