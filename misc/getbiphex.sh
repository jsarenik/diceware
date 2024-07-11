#!/bin/sh

hex=$(printf "%d" 0x${1:-0})
line=$(($hex+1))
#grep -w "^$hex" bip39-numbers.txt | cut -f2
sed -n "${line}p" bip-0039-english.txt
