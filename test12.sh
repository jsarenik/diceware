busybox head -c 16 < /dev/random | xxd -p | ./xf.sh | while read l; do echo $l; hal bip39 get-seed "$l"; done
