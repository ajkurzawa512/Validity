#!/usr/bin/sh
printf "Input file to check:\n1 = /etc/shadow\n2 = /etc/hosts\n3 = 1.sh\n4 = Input filename\n"
read INPUT_FILECHECK
if [ "$INPUT_FILECHECK" -eq "1" ]; then
	INPUT_FILECHECK="/etc/shadow";
elif [ "$INPUT_FILECHECK" -eq "2" ]; then
	INPUT_FILECHECK="/etc/hosts";
elif [ "$INPUT_FILECHECK" -eq "3" ]; then
	INPUT_FILECHECK="1.sh";
elif [ "$INPUT_FILECHECK" -eq "4" ]; then
	printf "Input filename: "
	read INPUT_FILECHECK
fi

printf "\n\nChecking file $INPUT_FILECHECK for access\n\n"

if [ -f $INPUT_FILECHECK ]; then
	printf "$INPUT_FILECHECK is enabled.\n"
	if [ -r $INPUT_FILECHECK ]; then
		printf "You have permissions to edit $INPUT_FILECHECK.\n"
	else	printf "You do NOT have permissions to edit $INPUT_FILECHECK.\n"; fi; fi

