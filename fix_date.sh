#!/bin/bash

#Changes the date from seconds since epoch to month in columns 8 and 27 of reddit_done2.csv
#Then replaces the content in created_utc and retreieved_utc and is saved to reddit_done3.csv
awk -F, -v OFS=","  'NR>=2 {$8=strftime("%b",$8);$27=strftime("%b",$27)};1' reddit_done2.csv > reddit_done3.csv
