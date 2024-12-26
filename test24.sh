busybox head -c 32 < /dev/urandom | xxd -c 32 -p | ./xf24.sh | while read l; do echo $l; hal bip39 get-seed "$l"; done
