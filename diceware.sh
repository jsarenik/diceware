#!/busybox/ash

a="/$0"; a=${a%/*}; a=${a:-.}; a=${a#/}/; BINDIR=$(cd $a; pwd)
export PATH=/busybox
#WL=${2:-"$BINDIR/diceware_wordlist_cz.txt"}
WL=${2:-"$BINDIR/diceware.wordlist.asc"}

  zzz=1
  zzo=6
  zoz=2
  zoo=5
  ozz=3
  ozo=4
  ooz=0
  ooo=0

test "$1" = "-wl" && {
  WL=$2
  shift
  shift
}

I=${1:-"12"}

getots() {
  R=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
  R=${R//1/o}
  R=${R//0/z}
  eval echo \$$R | grep '[1-6]' || getots
}

for i in $(seq $I)
do
  W=$(grep $(getots)$(getots)$(getots)$(getots)$(getots) $WL | awk '{print $2}')
  #W=$(echo $(getots)$(getots)$(getots)$(getots)$(getots))
  WF="$WF $W"
done

echo $WF
