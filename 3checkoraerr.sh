
cd /home/ak
touch oraerr`date +%Y%m%d%H%M`.log
egrep -i "stopped|terminated|error|failed|exit" alert.log 2>&1 oraerr`date +%Y%m%d%H%M`.log
