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
   mkdir -p `echo $DIRECTORY`
   echo "Success!"
fi
