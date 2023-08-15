#!/bin/bash

# Code created by Chat GPT (Little randomly)

for i in {0..255}; do
    printf "\e[48;5;${i}m%3d" "$i"
    [ $((($i + 1) % 8)) == 0 ] && printf "\e[0m\n" || printf " "
done
