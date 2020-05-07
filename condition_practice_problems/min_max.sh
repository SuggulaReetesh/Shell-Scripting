#!/bin/bash -x

min=9999999 
max=-999999 
for (( i=0 ; i<5 ;i++ )) 
do 
	num=$((RANDOM % (999 - 100) + 100 )) 
	echo $num 
	if [ $num -gt $max ]
    	 then 
	  	max=$num 
	 fi 
	if [ $num -lt $min ] 
	 then
		 min=$num 
	 fi 
done 
echo "maximum value $max"
echo "minimum value $min"
