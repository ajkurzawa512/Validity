#!/usr/bin/sh
if [ -f /etc/shadow ]; then
	printf "Shadow passwords are enabled.\n"; fi
if [ -r /etc/shadow ]; then
	printf "You have permissions to edit /etc/shadow.\n"
else	printf "You do NOT have permissions to edit /etc/shadow.\n"; fi

