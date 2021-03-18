#!/bin/bash
no_of_rows="68744 "
fields=$(head -1 reddit_done.csv | sed 's/[^,]//g' | wc -c)

input="$1"
for((i=1;i<=fields;i++))
do
        occurences=$(cut -d"," reddit_done.csv -f"$i" | uniq -c)
        if [[ $occurences == *$no_of_rows* ]]
        then
        array+=($i)
        fi
done < reddit_done.csv

remove=$(printf ',%s' "${array[@]}")

remove=${remove:1}

cut -d, -f"$remove" --complement < reddit_done.csv > reddit_done1.csv
