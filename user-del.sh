#!/bin/sh
uOld=0
uNew=0
for i in `more userlist.txt `
do
egrep "$i" /etc/passwd >/dev/null
if [ $? -eq 0 ];
then
	uOld=`expr $uOld + 1`
	userdel $i
	echo "Delete user $i"
else
	uNew=`expr $uNew + 1`
	echo "$i exists!"
fi
done
echo "AllUser:$(cat userlist.txt | wc -l) | DelUser:$uOld | ExiUser:$uNew"
