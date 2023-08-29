read -r -p "Enter an integer value: " number
 
# Make sure input is provided else die with an error
if [[ "$number" == "" ]]
then
    echo "$0 - Input is missing." 
    exit 1
fi
 
# The regular expression matches digits only 
if [[ "$number" =~ ^[0-9]+$ || "$number" =~ ^[-][0-9]+$  ]]
then
    echo "$0 - $number is an integer and passing this to ~/bin/task/task1.py -i $number -p /nfs/input.cvs"
else
    echo "$0 - $number is NOT an integer. Please enter integers only."
fi
