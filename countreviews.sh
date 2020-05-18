#!/bin/bash

grep -rc "<Overall>" $1 | sed 's/.*hotel/hotel/g' | sed 's/.dat:/ /g' | sort -k 2 -nr # counts the number of reviews in each file and sorts them numerically in reverse order
	# prints also the name of the file
	# the input is passed from the command line
