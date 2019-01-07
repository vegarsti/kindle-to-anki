# Make flashcards out of one-word highlights in Kindle

First install [this Anki script](https://github.com/sirupsen/anki-airtable).

The [`run_kindle_highlight_pipeline.sh`](run_kindle_highlight_pipeline.sh) bash script does the following.

1. Runs Ruby script to get the Kindle highlights
2. Filters out one-word highlights
3. Writes these to [my Airtable](https://airtable.com/tblojkgAOAhnfl3rc/viw9QuWEFketZlvfP)

From time to time, I go over the words in the spreadsheet and add their meaning. These words show up as flashcards in Anki. Nice!
