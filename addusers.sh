#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <users file>"
    exit
fi

while IFS=: read -r LINE
do
	us=$(echo $LINE | awk '{print $1}')
	pw=$(echo $LINE | awk '{print $2}')
	PASSHASH=`perl -e 'printf("%s\n", crypt($ARGV[0], "password"))' "$pw"`
	sudo -S useradd -m -d /home/ab3l -p $PASSHASH $us
done < "$1"
