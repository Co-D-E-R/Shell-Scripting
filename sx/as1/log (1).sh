N=$1
echo "common log of $N"
echo "scale=2;l($1)/l(10)" | bc -l

