#!/bin/sh

echo "ibase=16; obase=6; $(dd if=/dev/urandom bs=1 count=1 2>/dev/null | xxd -p | tr '[a-f]' '[A-F]');" | bc | grep -o '.$' | while read a; do echo $((a+1)); done
