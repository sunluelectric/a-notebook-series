#!/bin/bash

read -p "Enter a number: " n

a=0
b=1

echo "Fibonacci sequence up to $n terms:"

for (( i=0; i<n; i++ ))
do
    echo -n "$a "
    fn=$((a + b))
    a=$b
    b=$fn
done

echo

