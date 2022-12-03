File="puzzle3b.txt"
Lines=$(cat $File)
COUNTER=1
BIN1=""
BIN2=""
for Line in $Lines
do
    #LN=$((COUNTER/2))
	#echo $LN
	COUNTER=$[$COUNTER +1]
	if [ $((COUNTER % 2)) -eq 0 ]
	then
	    BIN2=$Line
	else
		BIN1=$Line
		if [ $COUNTER -gt 1 ]
		then
			cmd="echo -e \"${BIN1}\" | sed 's/\s*/\n/g' | sort | uniq"
			ret=$(eval "$cmd" > pz3a.txt)
			cmd2="echo -e \"${BIN2}\" | sed 's/\s*/\n/g' | sort | uniq"
			ret2=$(eval "$cmd2" > pz3b.txt)
			cmd3="comm -12 pz3a.txt pz3b.txt | tr -d '\n' | od -An -vtu1" # | awk '{if ($1-96<0) print $1-64+26; else print $1-96;}'"
			ret3=$(eval "$cmd3")
			echo "$ret3"
		fi
	fi
done