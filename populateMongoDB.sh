#!/bin/bash

#Input csv which will be inputted into the monogdb
input="reddit_1K.csv"

#Loop which will read each column in the csv into a variable which will be used to populate the mongodb
while IFS= read -r var
do

archived=$(cut -d',' -f1 <<<"$var")
author=$(cut -d',' -f2 <<<"$var")
author_cakeday=$(cut -d',' -f3 <<<"$var")
author_flair_text=$(cut -d',' -f4 <<<"$var")
author_id=$(cut -d',' -f5 <<<"$var")
brand_safe=$(cut -d',' -f6 <<<"$var")
contest_mode=$(cut -d',' -f7 <<<"$var")
created_utc=$(cut -d',' -f8 <<<"$var")
crosspost_parent=$(cut -d',' -f9 <<<"$var")
disable_comments=$(cut -d',' -f10 <<<"$var")
distinguished=$(cut -d',' -f11 <<<"$var")
domain=$(cut -d',' -f12 <<<"$var")
edited=$(cut -d',' -f13 <<<"$var")
gilded=$(cut -d',' -f14 <<<"$var")
hide_score=$(cut -d',' -f15 <<<"$var")
id=$(cut -d',' -f16 <<<"$var")
is_reddit_media_domain=$(cut -d',' -f17 <<<"$var")
is_self=$(cut -d',' -f18 <<<"$var")
is_video=$(cut -d',' -f19 <<<"$var")
locked=$(cut -d',' -f20 <<<"$var")
num_comments=$(cut -d',' -f21 <<<"$var")
num_crossposts=$(cut -d',' -f22 <<<"$var")
parent_whitelist_status=$(cut -d',' -f23 <<<"$var")
permalink=$(cut -d',' -f24 <<<"$var")
post_hint=$(cut -d',' -f25 <<<"$var")
promoted=$(cut -d',' -f26 <<<"$var")
retrieved_on=$(cut -d',' -f27 <<<"$var")
score=$(cut -d',' -f28 <<<"$var")
spoiler=$(cut -d',' -f29 <<<"$var")
stickied=$(cut -d',' -f30 <<<"$var")
subreddit=$(cut -d',' -f31 <<<"$var")
subreddit_id=$(cut -d',' -f32 <<<"$var")
suggested_sort=$(cut -d',' -f33 <<<"$var")
third_party_trackers=$(cut -d',' -f34 <<<"$var")
thumbnail_height=$(cut -d',' -f35 <<<"$var")
thumbnail_width=$(cut -d',' -f36 <<<"$var")
title=$(cut -d',' -f37 <<<"$var")
url=$(cut -d',' -f38 <<<"$var")
whitelist_status=$(cut -d','' ' -f39 <<<"$var")

#Reads each of the above variables into the appropriate place in our mongodb
mongo reddit_DB --eval \
'db.reddit_C.insert({archived: "'"$archived"'", author: "'"$author"'", author_cakeday: "'"$author_cakeday"'", author_flair_text: "'"$author_flair_text"'", author_id: "'"$author_id"'", brand_safe: "'"$brand_safe"'", contest_mode: "'"$contest_mode"'", created_utc>

#Finishes the process and takes our input file from the beginning as input
done < "$input"
