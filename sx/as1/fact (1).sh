echo "Enter a number :"
read n

count=$n
fact=1

if [ $count -lt 0 ]; then
echo "INVALID"
else
while [ $count -gt 1 ]
do
fact=`expr $count \* $fact`
count=`expr $count - 1`
done


fi
echo "The factorial of the number :: $fact"
