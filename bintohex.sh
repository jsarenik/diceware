#!/bin/sh
{
{
echo "obase=16; ibase=2; 1111"
test "$1" = "" && cat || echo "$@"
} | tr -d '\n '
echo
} | bc | cut -b2- | tr -d '\\\n' | grep .
