

cd /home/ak
date | cut -d" " -f2,3 >> trackslot.txt
touch loginout`date +%Y%m%d%H%M`.log
sudo last -f /var/log/wtmp  | egrep -i "logged in|(..:..)" | grep -v "reboot" | grep -f ./tlltime.txt | grep -f ./trackslot.txt 2>&1 loginout`date +%Y%m%d%H%M`.log
