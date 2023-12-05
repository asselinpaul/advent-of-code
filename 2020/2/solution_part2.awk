#!/bin/awk -f
BEGIN { FS=" "; }
{
	split($1, constraints, "-")
	letter = substr($2, 1, length($2) - 1);
	extracted_positions = substr($3, constraints[1], 1) substr($3, constraints[2], 1)
	count_in_pw = split(extracted_positions, a, letter) - 1;
	if (count_in_pw == 1){
		valid_pw_count++
	}
}
END {print "Total valid:", valid_pw_count}