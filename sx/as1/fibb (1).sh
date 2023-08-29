echo "Enter the number ::"
read num

echo "Fibbonacci are ::"

a=0
b=1
sum=0

echo "$a"
echo "$b"

count=3
while [ $count -lt $num ]
do
sum=`expr $a + $b`
a=$b
b=$sum
count=`expr $count + 1`
echo $b
done

