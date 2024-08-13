. ./bip39.inc ; while read w; do wn=$(eval echo \$$w); for i in $(seq 12); do echo $wn; done | tr -d '\n'; echo; done
#| rev | cut -b2- | rev
#| while read l; do echo $l | sh bintohex.sh ; done
