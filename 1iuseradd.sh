
#!/bin/bash
ROOT_UID=0
SUCCESS=0
E_USEREXISTS=70

# Run as root, of course. (this might not be necessary, because we have to run the script somehow with root anyway)
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

#test, if both argument are there
#if [ $# -eq 2 ]; then
#username=$1
#pass=$2
echo "enter login name"
read username

	# Check if user already exists.
	grep -q "$username" /etc/passwd
	if [ $? -eq $SUCCESS ] 
	then	
	echo "User $username does already exist."
  	echo "please chose another username."
	exit $E_USEREXISTS
	fi  
echo "enter password (ensure it is 8 char only)"
read pass
ps=`echo $pass | wc -c`

	if [ $ps -lt 9 ] 
	then	
	echo "password too short - min 8 char required."
	exit $E_USEREXISTS
	fi  
#----------------------------------------------------------------------------

cd /home/ak

echo "Enter your dept code"

alldep=`ls VESIT `
select dc in `echo $alldep` ; do

    case $dc in

       * ) echo $dc; break;;

        No ) echo Enter valid number;;

    esac

done

echo "Enter your year code"

allyr=`ls VESIT/$dc `
select yr in `echo $allyr` ; do

    case $yr in

       * ) echo $yr; break;;

        No ) echo Enter valid number;;

    esac

done


echo "Enter your division code"

alldiv=`ls VESIT/$dc/$yr `
select dv in `echo $alldiv` ; do

    case $dv in

       * ) echo $dv; break;;

        No ) echo Enter valid number;;

    esac

done

echo "Enter your Roll no."
read rn

    case $rn in

       [01-60] ) echo $rn; break;;

        No ) echo Enter valid number;;

    esac


DIRECTORY=VESIT/`echo $dc/$yr/$dv/$rn`

if [ -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY exists.
   echo "The Directory for this roll no. already exists"
   exit;
else
#   mkdir -p `echo $DIRECTORY`
   echo "Success!"
fi
#----------------------------------------------------------------------------

#useradd -p `mkpasswd "$pass"` -d /home/"$DIRECTORY" -m -g users -s /bin/bash "$username"
#adduser -p -d /home/ak/`echo $DIRECTORY` -m -g users -s /bin/bash "$username"
useradd $username -d /home/ak/`echo $DIRECTORY` -m -p $pass
#else
#        echo  " this programm needs 2 arguments you have given $# "
#        echo  " you have to call the script $0 username and the pass "
#fi
#
exit 0
