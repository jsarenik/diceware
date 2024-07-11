{
{
echo "obase=16; ibase=2;"
test "$1" = "" && cat || echo $1
} | tr -d '\n '
echo
} | bc 
