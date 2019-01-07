from airtable import Airtable
from secrets import API_key, base_key

# Update words in base
airtable = Airtable(base_key=base_key, table_name="Words", api_key=API_key)
records = [
    record.get("fields")
    for record in airtable.get_all(view="All words", maxRecords=2000)
    if record.get("fields")
]

all_words_in_airtable = [record.get("Word") for record in records if record.get("Word")]

filename = "words.txt"
with open(filename, "r") as f:
    all_highlights = [words.strip() for words in f.readlines()]

new_words = 0
for word in all_highlights:
    if not word in all_words_in_airtable:
        airtable.insert({"Word": word})
        new_words += 1

print(new_words)
