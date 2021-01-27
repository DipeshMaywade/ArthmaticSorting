#!/bin/bash -x

read -p "Enter the value of A: " a
read -p "Entr the value of B: " b
read -p "Enter the valur of C: " c

value1=$((a+b*c))
value2=$((a*b+c))
value3=$((c+a/b))
value4=$((a%b+c))

declare -A dict

dict[1]=$value1
dict[2]=$value2
dict[3]=$value3
dict[4]=$value4

echo ${!dict[@]}

for (( i=1; i<=4; i++ ))
do
	array[i]=${dict[$i]}
done

echo ${array[@]}

for (( j=1; j<=${#array[@]}; j++ ))
do
	for (( k=1; k<=$j; k++ ))
	do
		if [ ${array[$j]} -lt ${array[$k]} ]
		then
			temp=${array[k]}
			array[k]=${array[j]}
			array[j]=$temp
		fi
	done
done
echo ${array[@]}
