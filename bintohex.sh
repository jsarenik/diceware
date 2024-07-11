{
{
printf "obase=16; ibase=2; 1111"
test "$1" = "" && cat || echo $1
} | tr -d '\n '
echo
} | bc | cut -b2-
