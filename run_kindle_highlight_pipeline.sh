#!/bin/bash

source wordenv/bin/activate
pip install -r kindle-requirements.txt
ruby fetch_kindle_highlights.rb > highlights.txt
python filter_words.py > words.txt
DATE=`date +%Y-%m-%d`
N=`python write_words_to_airtable.py`
echo "$DATE $N" >> cron_log.txt
deactivate