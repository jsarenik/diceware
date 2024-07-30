# this takes Electrum-generated mnemonic
# and fixes the last word to be BIP-39
# while retaining all the other words
#
# Of course such mnemonic points to a wholly
# different extended private key...

./rxf.sh \
          circle turkey border bacon immune distance \
          enjoy uniform base myth cheap news \
          | sh bintohex.sh | ./xf.sh
