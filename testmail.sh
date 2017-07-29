
if [ -s ./trackslot.txt ]
then
	echo | mutt  -s "Process Down"  adityatestkrshnn@gmail.com  -a ./trackslot.txt
fi

exit 0
