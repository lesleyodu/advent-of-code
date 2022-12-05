#https://unix.stackexchange.com/questions/461285/how-to-transpose-x-and-y-axis-of-table-using-cut-paste-shell-commands
File="puzzle5c.txt"
stackstr=$(cat $File)
stacks=($stackstr)
File2="puzzle5d.txt"
commandstr=$(cat $File2 | sed 's/[^0-9 ]//g')
commands=($commandstr)
for i in ${!commands[@]};
do
	if [ $(($i % 3)) -ne 0 ]
	then
		continue
	fi
	#echo ${stacks[$i]}
	#https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays
	reps=${commands[$i]}
	from=${commands[$i+1]}-1
	to=${commands[$i+2]}-1
	#part 1
	#stacks[$to]=${stacks[$to]}$(echo ${stacks[$from]: -$reps} | rev)
	#part 2
	stacks[$to]=${stacks[$to]}$(echo ${stacks[$from]: -$reps})
	fromstr=${stacks[$from]}
	sl=${#fromstr}
	stacks[$from]=${stacks[$from]:0:$sl-reps}
	#break
done

for i in ${!stacks[@]};
do
	echo ${stacks[$i]: -1}
done