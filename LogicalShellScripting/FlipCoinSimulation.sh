#!/bin/bash -x
#UseCase 1 
flip(){
	if [ $((RANDOM%2)) -eq 0 ]
	then
		echo "H"
	else
		echo "T"
	fi
}

#UseCase 2
singlets(){
declare -A singlets
for (( i=0;i<n;i++ ))
do
	result="$( flip )"
	(( singlets[$result] ++))
	
done
for i in "${!singlets[@]}"
do
  if [[ ${singlets[$i]} -gt $winningcombinationvalue ]]
  then
  	winningcombinationvalue=${singlets[$i]}
  	wincombinationkey=$i
  fi	
  echo " $i : ${singlets[$i]} Percentage : $((${singlets[$i]}*100/n)) " 
done
}

#UseCase 3
doublets(){
declare -A doublets
for (( i=0;i<n;i++ ))
do
	result=$(flip)$(flip)
	(( doublets[$result] ++))
	
done
for i in "${!doublets[@]}"
do
  if [[ ${doublets[$i]} -gt $winningcombinationvalue ]]
  then
  	winningcombinationvalue=${doublets[$i]}
  	wincombinationkey=$i
  fi
  echo " $i : ${doublets[$i]} Percentage : $((${doublets[$i]}*100/n)) " 
done
}

#UseCase 4
triplets(){
declare -A triplets
for (( i=0;i<n;i++ ))
do
	result=$(flip)$(flip)$(flip)
	(( triplets[$result] ++))

done
for i in "${!triplets[@]}"
do
  if [[ ${triplets[$i]} -gt $winningcombinationvalue ]]
  then
		winningcombinationvalue=${triplets[$i]}
		wincombinationkey=$i
	   fi	
 echo " $i : ${triplets[$i]} Percentage : $((${triplets[$i]}*100/n)) " 
done
}

read -p "Enter number of times to flip the coin " n
singlets
doublets
triplets

#UseCase 5
echo "$wincombinationkey $winningcombinationvalue" 