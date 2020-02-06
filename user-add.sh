#!/bin/sh
uOld=0
uNew=0
for i in `more userlist.txt `
do
egrep "$i" /etc/passwd >/dev/null
if [ $? -eq 0 ];
then
	uOld=`expr $uOld + 1`
	echo "$i exists!"
else
	uNew=`expr $uNew + 1`
	#adduser --disabled-password --gecos "First Last,RoomNumber,WorkPhone,HomePhone" $i 1>/dev/null 2>&1
	adduser --disabled-password --gecos "$i" $i 1>/dev/null 2>&1
	echo "$i:Password" | chpasswd 1>/dev/null 2>&1
	echo "Add User $i"
fi
done
echo "AllUser:$(cat userlist.txt | wc -l) | OldUser:$uOld | NewUser:$uNew"
