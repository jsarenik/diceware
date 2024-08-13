#!/bin/sh
{
{
echo "obase=16; ibase=2; 11"
test "$1" = "" && cat || echo "$@"
echo 11
} | tr -d '\n '
echo
} | bc | cut -b3- | rev | cut -b3- | rev
