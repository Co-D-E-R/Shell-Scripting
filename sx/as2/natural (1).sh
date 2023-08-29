n=$#
sum=0
if ((n<1))
then
echo "INVALID INPUT"
exit
fi
for((i=1;i<=$n;i++))
do
sum=$(($sum+$1))
shift
done
echo "The sum is  :: $sum"
echo " "
