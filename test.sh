#!/bin/sh

timeout 10 ash -s </dev/null 2>/dev/null <<EOF
. $PWD/ozo.inc

while
  true
do
  getots
done > /tmp/test$$
EOF

sort /tmp/test$$ | uniq -c
rm /tmp/test$$
