for i in $(seq 2048); do word=$(sed -n "${i}p" misc/bip-0039-english.txt);
    for n in $(seq 12); do echo $word; done | paste -d" " -s | ./rxf.sh | sh bintohex.sh | ./xf.sh
    for n in $(seq 24); do echo $word; done | paste -d" " -s | ./rxf.sh -l | sh bintohex.sh | ./xf.sh -l
done
