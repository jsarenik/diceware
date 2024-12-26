#!/bin/sh

busybox timeout 10 busybox ash -se <<EOF
while
  true
do
  #echo "ibase=16; obase=10; \$(dd if=/dev/urandom bs=1 count=1 2>/dev/null | xxd -p | tr '[a-f]' '[A-F]')%6+1;" | bc
  #dd if=/dev/urandom bs=1 count=1 2>/dev/null | xxd -p
  busybox dd if=/dev/urandom bs=1 count=1 2>/dev/null | busybox xxd -p | busybox cut -b1
done > /tmp/test$$
EOF

sort /tmp/test$$ | uniq -c | sort -nk1
rm -v /tmp/test$$
