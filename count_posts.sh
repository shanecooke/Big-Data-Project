#!/bin/bash

#Cuts column 8 from reddit_done3.csv, removes the first index row and counts the occurence of
#each month in this column
echo "Posts created: "
cut -d"," -f8 reddit_done3.csv | sed "1 d" | uniq -c
