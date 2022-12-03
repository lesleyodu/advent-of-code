File="puzzle3.txt"
Lines=$(cat $File)
COUNTER=1
ELF1=""
ELF2=""
ELF3=""
for Line in $Lines
do
	if [ $((COUNTER % 3)) -eq 1 ]
	then
	    ELF1=$Line
	elif [ $((COUNTER % 3)) -eq 2 ]
	then
		ELF2=$Line
	else
		ELF3=$Line
		if [ $COUNTER -gt 1 ]
		then
			cmd="echo -e \"${ELF1}\" | sed 's/\s*/\n/g' | sort | uniq"
			ret=$(eval "$cmd" > pz3c.txt)
			cmd2="echo -e \"${ELF2}\" | sed 's/\s*/\n/g' | sort | uniq"
			ret2=$(eval "$cmd2" > pz3d.txt)
			cmd3="comm -12 pz3c.txt pz3d.txt"
			ret3=$(eval "$cmd3" > pz3e.txt)
			cmd4="echo -e \"${ELF3}\" | sed 's/\s*/\n/g' | sort | uniq"
			ret4=$(eval "$cmd4" > pz3f.txt)
			cmd5="comm -12 pz3e.txt pz3f.txt | tr -d '\n' | od -An -vtu1"
			ret5=$(eval "$cmd5")			
			echo "$ret5"
		fi
	fi
	COUNTER=$[$COUNTER +1]
done