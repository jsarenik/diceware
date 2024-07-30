# meant to be sourced into other POSIX shell script

x0=0000
x1=0001
x2=0010
x3=0011
x4=0100
x5=0101
x6=0110
x7=0111
x8=1000
x9=1001
xa=1010
xb=1011
xc=1100
xd=1101
xe=1110
xf=1111

cutb=2
test "$1" = "" && read -r inn || inn=$1
#test $(printf '%s' \"$inn\" | wc -c) -gt 32 && { cutb=2; shift; }
lower=$(echo $inn | tr '[A-F]' '[a-f]')
upper=$(echo $inn | tr '[a-f]' '[A-F]')
entropy=$(echo $lower | eval echo $(sed 's/[0-9a-f]/${x&}/g'))
#entropy=$(echo $entropy | rev | cut -b 12- | rev)
checksum=$(printf $upper | /usr/bin/xxd -r -p | sha256sum | cut -b-${cutb})
bincs=$(echo $checksum | eval echo $(sed 's/[0-9a-f]/${x&}/g'))
echo "$checksum (hex) = $bincs (bin)" >&2
#echo $bincs
full="${entropy}${bincs}"
#full="${full%%${full#*${bincs}}}"
echo $full >&2
#| fold -w 11 | tr -d "
#echo $full | fold -w 11  |wc -l
#| while read line; do (cd misc; sh getbip.sh $(echo "ibase=2; $line" | bc)); done | wc -l
#echo $full | fold -w 11 | while read line; do (cd misc; sh getbip.sh $(echo "ibase=2; $line" | bc)); done | wc -l
echo $full | fold -w 11 | while read line; do (cd misc; sh getbip.sh $(echo "ibase=2; $line" | bc)); done | paste -d " " -s
