#!/bin/sh

WL=${2:-"diceware_wordlist_cz.txt"}

test "$1" = "-wl" && {
  WL=$2
  shift
  shift
}

I=${1:-"6"}

for i in $(seq $I)
do
  W=$(grep $((RANDOM%6+1))$((RANDOM%6+1))$((RANDOM%6+1))$((RANDOM%6+1))$((RANDOM%6+1)) $WL | awk '{print $2}')
  WF="$WF $W"
done

echo $WF
