File="pz7names2.txt"
dirstr=$(cat $File | tr -d '\r')
dir=($dirstr)
for i in ${!dir[@]};
do
    d=${dir[$i]}
	cmd=$(cat pz7join.txt | grep "^$d" | sed 's/[^0-9]//g' | tr '\n' '+' | sed 's/\+$//g' | sed 's/$/\n/' | bc -l)
    echo $cmd
done