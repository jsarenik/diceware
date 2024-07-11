#!/bin/busybox sh

export PATH=/busybox:$PATH
N=${1:-50}
time sh -c "while ! sh myran.sh $N; do :; printf .; done;"
