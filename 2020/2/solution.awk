#!/bin/awk -f
BEGIN { FS=" "; }
{
	split($1, constraints, "-")
	letter = substr($2, 1, length($2) - 1);
	count_in_pw = split($3, a, letter) - 1;
	if (count_in_pw >= constraints[1] && count_in_pw <= constraints[2])
	 {
	 	valid_pw_count++;
	 }
	 print constraints[1], count_in_pw, constraints[2]
}
END {print "Total valid:", valid_pw_count}