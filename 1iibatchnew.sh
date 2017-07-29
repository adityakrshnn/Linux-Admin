

ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

sh ./1iiibackupvesit.sh
sh ./makevesit.sh
