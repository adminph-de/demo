#!/bin/bash

# find/filter pattern
find . -type f -exec grep -H 'AWS::' {} \; > filter.txt

# cut anything else:
cut filter.txt -d ' ' -f 6 > cut.txt

# remove duplicates
sort -u cut.txt > sort.txt