#!/bin/bash
# Download the html file from lichess
# The s flag makes curl run the operation silently
curl -s https://lichess.org/@/$1 --output .step1.txt

# Grep out the time controls and rating, output the search matches to another file
grep -Po '<span><h3>.+?<\/strong>' .step1.txt > .step2.txt

# Isolate the rating controls
grep -Po '(?<=<span><h3>).+?(?=<\/h3>)' .step2.txt > .step3.txt

# Isolate the ratings
grep -Po '(?<=<strong>).+?(?=<)' .step2.txt > .step4.txt

# Merge the files
pr -m -t .step3.txt .step4.txt > .final.txt

# Display ratings
rm -rf .step*.txt
