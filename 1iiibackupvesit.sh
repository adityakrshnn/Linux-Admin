
cd /home/ak
touch backup`date +%Y%m%d%H%M`.log
tar -cvf VESIT`date +%Y%m%d%H%M`.tar VESIT 2>&1 backup`date +%Y%m%d%H%M`.log
