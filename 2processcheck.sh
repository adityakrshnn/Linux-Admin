
cd /home/ak
touch processcheck`date +%Y%m%d%H%M`.log
ps -ael | grep -i oracle | grep -i defunct 2>&1 processcheck`date +%Y%m%d%H%M`.log

if [ -s ./processcheck`date +%Y%m%d%H%M`.log ]
then
     echo | mutt  -s "Process Down"  adityatestkrshnn@gmail.com  -a ./processcheck`date +%Y%m%d%H%M`.log
fi


