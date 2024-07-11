#!/bin/sh

line=$(($1+1))
sed -n "${line}p" bip-0039-english.txt
#grep -w "^${1:-0}" bip39-numbers.txt | cut -f2
