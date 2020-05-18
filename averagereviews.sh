#!/bin/bash

filename=$1 # file or directory taken from the command line

if [[ -d $filename ]] # checks if it is a directory
then
	
	cd $( echo $filename | tr -d '\r') # change the working directory to be the input taken from the command line
	
	for file in * # iterate rhrough the items of the directory
	do
		if [[ -f $file ]] # checks if it is a file
		then
			awk -F ">" 'BEGIN{ORS=" "; count=0; sum=0}/<Overall>/{count++; sum=sum+$2}END{print FILENAME; printf ("%0.2f\n", sum/count)}' $file | sed 's/.dat//g'
			# calculate the sum of reviews for each hotel and the cunt of how many reviews does one hotel have
			# prints the average review for each hotel
		fi
	done | sort -k 2 -nr # sort the average reviews
else
	if [[ -f $filename ]] # check if it is a file
	then 
		awk -F ">" 'BEGIN{ORS=" "; count=0; sum=0}/<Overall>/{count++; sum=sum+$2}END{print FILENAME; printf ("%0.2f\n", sum/count)}' $filename | sed 's/.dat//g'
		# same algorithm as above for one hotel
	fi
fi
