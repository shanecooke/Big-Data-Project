#!/bin/bash

#Cuts column 37 from reddit_done4.csv, removes the punctuation, and saves to nopunct.csv
cut -d',' -f37 <"reddit_done4.csv" | tr -d '[:punct:]'  > nopunct.csv

#Replaces column 37 in reddit_done4.csv with the contents of nopunct.csv
#The resulting database is saved to reddit_done5.csv
awk 'BEGIN{FS=",";OFS=","}FNR==NR{a[NR]=$1;next}{$37=a[FNR]}1' nopunct.csv reddit_done4.csv > reddit_done5.csv

#Deletes nopunct.csv as we no longer need it
rm nopunct.csv
