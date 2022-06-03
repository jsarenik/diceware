# meant to be sourced into other POSIX shell script

zzz=1
zzo=6
zoz=2
zoo=5
ozz=3
ozo=4
#  ooz=0
#  ooo=0

getots() {
  R=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
  test ${R%%[01]} = "11" && getots || {
    R=${R//1/o}
    eval echo \$${R//0/z}
  }
}
