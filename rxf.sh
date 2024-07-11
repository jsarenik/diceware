#!/bin/sh

# meant to be run by a POSIX shell

x0=0000
x1=0001
x2=0010
x3=0011
x4=0100
x5=0101
x6=0110
x7=0111
x8=1000
x9=1001
xa=1010
xb=1011
xc=1100
xd=1101
xe=1110
xf=1111

test "$1" = "" && read -r mnemonic || mnemonic=$*
echo $mnemonic >&2
for w in $mnemonic; do line=$(echo "obase=2; ibase=16; $(printf '%04X\n' $(grep -w $w misc/bip39-numbers.txt | cut -f1))" | bc);
  len=$(printf "%s" "$line" | wc -c)
  missing=$((11-$len))
  for i in $(seq $missing); do printf 0; done
  echo $line
done | paste -d" " -s | tr -d " " | fold -w 4 | sed '$d' | tr -d '\n'
echo
#for w in $mnemonic; do printf '%X' $(grep -w $w misc/bip39-numbers.txt | cut -f1); done
exit
lower=$(echo $1 | tr '[A-F]' '[a-f]')
upper=$(echo $1 | tr '[a-f]' '[A-F]')
entropy=$(echo $lower | eval echo $(sed 's/[0-9a-f]/${x&}/g'))
checksum=$(printf $upper | xxd -r -p | sha256sum | cut -b1)
echo $checksum
bincs=$(eval echo '''${x'$checksum'}''')
echo $bincs
full="${entropy}${bincs}"
echo $full | fold -w 11
echo $full | fold -w 11 | while read line; do (cd misc; sh getbip.sh $(echo "ibase=2; $line" | bc)); done
