{
{
printf "obase=16; ibase=2; 11"
test "$1" = "" && cat || echo $1
echo 11
} | tr -d '\n '
echo
} | bc | cut -b2- | rev | cut -b2- | rev
