#!/bin/bash
# Download the html file from lichess
# The s flag makes curl run the operation silently
curl -s https://lichess.org/@/$1 --output .step1.txt

# Grep out the time controls and rating, output the search matches to another file
grep -Po '<span><h3>.+?<\/strong>' .step1.txt > .step2.txt

# Isolate the ratings
grep -Po '(?<=<strong>).+?(?=<)' .step2.txt > .step3.txt

#Changing ? at empty lines to 0
sed 's/^?$/0/g' .step3.txt > .step4.txt

#Removing all ? symbols
sed 's/?//g' .step4.txt > .final.txt

rm -rf .step*.txt