. ./bip39.inc ; while read w; do wn=$(eval echo \$$w); for i in $(seq 12); do echo $wn; done | tr -d '\n'; echo; done < misc/bip-0039-english.txt | while read l; do echo $l | sh bintohex.sh ; done
