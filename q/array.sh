#!/bin/bash

num=(1 3 4)

n=5

for (( i=0;i<"$n";i++ ));do
	echo "Enter the number::"
	read num1
	num=("${num[@]}" "$num1")
done

echo "Before sort ::"
for i in "${num[@]}";do
	echo "$i "
done

echo "After sort ::"

IFS=$'\n'
so=($(sort --numeric-sort <<<"${num[*]}"))
unset IFS

for i in "${so[@]}";do
	echo "$i "
done
