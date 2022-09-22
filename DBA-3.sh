#!/usr/bin/sh
SOURCE="this-is-aws.abcdefg.us-east-1.rds.amazone.com"
TARGET="10.10.10.11"

FIND_TBLs="SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA NOT IN ('sys','mysql','information_schema','performance_schema')"
FIND_DBs="SELECT TABLE_SCHEMA FROM information_schema.tables WHERE TABLE_NAME="

TBLs=`mysql -h $SOURCE -P 3306 -u admin -p"admin123" -e "$FIND_TBLs"` 
for i in $TBLs; do
	if [ "$i" != "TABLE_NAME" ]; then 
		a=`mysql -h $SOURCE -P 3306 -u admin -p"admin123" -e "$FIND_DBs'$i'"`
		SCH=`echo $a|cut -d' ' -f2`
		mysqldump -h $SOURCE -P 3306 -u admin -p"admin123" $SCH $i | bzip2 > $SCH.$i.sql.bz2
		mysql  -h $TARGET -P 3306 -u admin -p"admin123" -e "create DATABASE $SCH"
	 	bunzip2 < $SCH.$i.sql.bz2 | mysql -h $TARGET -P 3306 -u admin -p"admin123" $SCH
		rm $SCH.$i.sql.bz2
	fi
done

