echo "Enter the size of the array ::"
read n
echo "Enter number::"
i=0
while [ $i -lt $n ]
do
read arr[$i]
i=`expr $i + 1`
done
for((i=1;i<n;i++))
do
j=$i-1
temp=${arr[$i]}
while((j>=0 && arr[j]>temp))
do
arr[$j+1]=${arr[$j]}
j=$j-1
done
arr[j+1]=$temp
done
echo "array ::"
for((i=0;i<n;i++))
do
echo ${arr[$i]}
done
