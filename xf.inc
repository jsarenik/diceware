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

getots() {
  eval echo $(sed 's/[0-9a-f]/${x&}/g') | fold -w 11
}
