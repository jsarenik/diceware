#!/bin/sh

/busybox/timeout 10 /busybox/ash -s </dev/null 2>/dev/null <<EOF
. $PWD/ozo.inc
#  zzz=1
#  zzo=6
#  zoz=2
#  zoo=5
#  ozz=3
#  ozo=4
##  ooz=0
##  ooo=0
#getots() {
#  R=\$((RANDOM%2))\$((RANDOM%2))\$((RANDOM%2))
#  test \${R%%[01]} = "11" && return
#  R=\${R//1/o}
#  R=\${R//0/z}
#  eval echo \\$\$R
#}
while
  true
do
  getots
done > /tmp/test$$
EOF

sort /tmp/test$$ | uniq -c
rm /tmp/test$$
