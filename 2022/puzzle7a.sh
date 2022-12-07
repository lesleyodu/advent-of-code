File="pz7dir.txt"
dirstr=$(cat $File | tr -d '\r')
dir=($dirstr)
stack=()
for i in ${!dir[@]};
do
	if [ $i -eq 0 ]
	then
	    echo '/'
		continue
    fi

    d=${dir[$i]}
    if [ $d != '..' ]
	then
	    stack+=($d)
		echo $(printf "/%s" "${stack[@]}" | sed 's/$/\//')
	else
	    sz=${#stack[@]}-1
	    unset "stack[$sz]"
	fi
done