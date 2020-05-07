#!/bin/bash -x
read -p "Enter month in number" month
read -p "Enter day"  day
check=0
if [[ ( "$day" -gt "20" ) && ( "$day" -lt "31" ) && ( "$month" -eq "3" ) ]]
then
    check=1
fi    
if [[ ( "$day" -gt "1" ) && ( "$day" -lt "30" ) && ( "$month" -eq "4" ) ]]
then
    check=1
fi 
if [[ ( "$day" -gt "1" ) && ( "$day" -lt "31" ) && ( "$month" -eq "5" ) ]]
then
    check=1
fi  
if [[ ( "$day" -gt "1" ) && ( "$day" -lt "20" ) && ( "$month" -eq "6" ) ]]
then
    check=1
fi  

if [[ "$check" -eq 1 ]]
then 
  echo true
else
  echo false
fi