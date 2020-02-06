#!/bin/sh
uOld=0
uNew=0
for i in `more userlist.txt `
do
user=$(echo $i | cut -d ":" -f 1)
egrep "$user" /etc/passwd >/dev/null
if [ $? -eq 0 ];
then
	uOld=`expr $uOld + 1`
	userdel $user
	echo "Delete user $user"
else
	uNew=`expr $uNew + 1`
	echo "$user exists!"
fi
done
echo "AllUser:$(cat userlist.txt | wc -l) | DelUser:$uOld | ExiUser:$uNew"
