#!/bin/bash

#Variable to contain the counter
COUNTER=0

#Reading the necessary columns from the csv into variables which will be used to populate the mysql database
while IFS= read -r var
do
	COUNTER=$[COUNTER +1]
	echo "$COUNTER"
	author_id=`echo $var | cut -d"," -f5` 
	author=`echo $var | cut -d"," -f2` 
	author_cakeday=`echo $var | cut -d"," -f3` 

	subreddit=`echo $var | cut -d"," -f31`
 
	id=`echo $var | cut -d"," -f16` 
	created_month=`echo $var | cut -d"," -f8` 
	title=`echo $var | cut -d"," -f37`

#Inserts all of the above variables into our mysql database
	mysql -h localhost -D \
	'dba1' -e "INSERT INTO user VALUES ('$author_id', '$author', '$author_cakeday'); INSERT IGNORE INTO subreddit VALUES ('$subreddit'); INSERT INTO post VALUES ('$id', '$author_id', '$subreddit', '$created_month', '$title');"
done < reddit_10K.csv
