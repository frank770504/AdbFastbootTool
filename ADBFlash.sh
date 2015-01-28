#!/bin/bash

#echo "The script name is        ==> $0"
#echo "Total parameter number is ==> $#"
#echo "Your whole parameter is   ==> '$@'"

#_num=1

#for _var in $@
#do
#	echo "The $_num-st parameter         ==> $_var"
#	_num=$((_num+1))
#done
#
#echo ""

[ "$#" -lt 1 ]   \
	&& echo "flash all----------" \
	&& fastboot flash boot boot.img \
	&& fastboot flash -S 200M system system.img \
	&& fastboot flash userdata userdata.img \
	&& exit 0


_num=1

for _var in $@
do

case $_var in
	"b")
	echo "flash boot----------"
	fastboot flash boot boot.img
	;;
	"bf")
	echo "format boot---------"
	fastboot format boot
	;;
	"s")
	echo "flash system--------"
	fastboot flash -S 200M system system.img
	;;
	"sf")
	echo "format system-------"
	fastboot format system
	;;
	"u")
	echo "flash userdata------"
	fastboot flash userdata userdata.img
	;;
	"uf")
	echo "format userdata-----"
	fastboot format userdata
	;;
	*)
	echo "it contains not recognizable command"
	;;
esac
done

exit 0
