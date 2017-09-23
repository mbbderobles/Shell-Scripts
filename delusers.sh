#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <users file>"
    exit
fi

while IFS=: read -r LINE
do
	us=$(echo $LINE | awk '{print $1}')
	pw=$(echo $LINE | awk '{print $2}')
	sudo userdel $us
	#sudo rm -r /home/ab3l
done < "$1"
