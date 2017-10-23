#!/bin/bash

# ContaPalavras.sh - Conta número de cada palavra que aparece em texto.txt

cat $1 | tr [A-Z] [a-z] | sed 's/ /\n/g; s/[[:punct:]]//g; s/[0-9]//g; s/^http//g' >> t1.dat

cat t1.dat | sort | uniq >> t2.dat

for item in $(cat t2.dat)
do
	contador=$(cat $1 | grep -ic $item)
	echo $item": " $contador >> t3.dat
	cat t3.dat | sort -t':' -k2 -nr > conta_final.txt
done

rm *.dat





