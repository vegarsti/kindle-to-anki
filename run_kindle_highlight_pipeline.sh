#!/bin/bash

source set_kindle_password_environment_variable.sh
ruby fetch_kindle_highlights.rb > highlights.txt

source wordenv/bin/activate
python filter_words.py > words.txt
awk '{if (NF == 1) print tolower($1)}' highlights.txt | awk '{gsub(/[[:punct:]]/, "")} 1' > words_awk.txt
# should be exactly the same, but this also includes '-'
DATE=`date +%Y-%m-%d`
N=`python write_words_to_airtable.py`
echo "$DATE $N" >> cron_log.txt
deactivate