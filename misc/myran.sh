{
while true
do
  echo "$((RANDOM%2))"
done | sed "${1}q" | tr -d '\n'
echo
} | grep -E "^0{$1}\$"
