a=0; cat misc/bip-0039-english.txt | while read w; do printf "%s=%s\n" $w $(printf "obase=2; ibase=16; %03X\n" $a | bc | sed 's/^.*$/00000000000&/' | rev | cut -b-11 | rev); a=$((a+1)); done
#> bip39.inc
