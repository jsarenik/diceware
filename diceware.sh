#!/busybox/ash

a="/$0"; a=${a%/*}; a=${a:-.}; a=${a#/}/; BINDIR=$(cd $a; pwd)
export PATH=/busybox
#WL=${2:-"$BINDIR/diceware_wordlist_cz.txt"}
WL=${2:-"$BINDIR/diceware.wordlist.asc"}

. $PWD/ozo.inc

test "$1" = "-wl" && {
  WL=$2
  shift
  shift
}

I=${1:-"12"}

for i in $(seq $I)
do
  W=$(grep $(getots)$(getots)$(getots)$(getots)$(getots) $WL | awk '{print $2}')
  #W=$(echo $(getots)$(getots)$(getots)$(getots)$(getots))
  WF="$WF $W"
done

echo $WF
