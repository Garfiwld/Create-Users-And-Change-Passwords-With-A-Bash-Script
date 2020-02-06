#!/bin/sh
uOld=0
uNew=0
for i in `more userlist.txt `
do
user=$(echo $i | cut -d ":" -f 1)
pass=$(echo $i | cut -d ":" -f 2)
egrep "$user" /etc/passwd >/dev/null
if [ $? -eq 0 ];
then
	uOld=`expr $uOld + 1`
	echo "$user exists!"
else
	uNew=`expr $uNew + 1`
	#--gecos "First Last,RoomNumber,WorkPhone,HomePhone"
	adduser --disabled-password --gecos "$user" $user 1>/dev/null 2>&1
	echo "$user:$pass" | chpasswd 1>/dev/null 2>&1
	echo "Add User $user"
fi
done
echo "AllUser:$(cat userlist.txt | wc -l) | OldUser:$uOld | NewUser:$uNew"
