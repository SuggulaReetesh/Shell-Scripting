#!/bin/bash -x

#UseCase 1
readinputs(){
	read -p "Enter a value " a
	read -p "Enter b value " b
	read -p "Enter c value " c

}
double -A results_dict
counter=0
compute(){
	readinputs
	results_dict[((counter++))]=$(( a+b+c ))        #UseCase 2,6
	results_dict[((counter++))]=$(( a*b+c ))        #UseCase 3,6
	results_dict[((counter++))]=$(( c+a/b ))        #Usecase 4,6
	results_dict[((counter++))]=$(( a%b+c ))        #UseCase 5,6
	echo "computed results: ${results_dict[@]}"
}
#UseCase 6
store_to_array(){
	compute
	count=0;
	for i in ${results_dict[@]}
	do
    results_array[((count++))]=$i;
	done 
	#echo ${results_array[@]}
}
#UseCase 7,8
sorting_results(){
store_to_array

#asceding order
for ((i=0;i<${#results_array[@]}-1;i++))
do
	for ((j=i+1;j<${#results_array[@]};j++))
	do
		if ((${results_array[i]} > ${results_array[j]}))
		then    
			temp=${results_array[$j]};
	    	results_array[$j]=${results_array[$i]};
	    	results_array[$i]=$temp;
	    fi
	done
done
echo "ascending order ${results_array[@]}"

#descending order
for ((i=0;i<${#results_array[@]}-1;i++))
do
	for ((j=i+1;j<${#results_array[@]};j++))
	do
		if ((${results_array[i]} < ${results_array[j]}))
		then    
			temp=${results_array[$j]};
	    	results_array[$j]=${results_array[$i]};
	    	results_array[$i]=$temp;
	    fi
	done
done
echo "descending order ${results_array[@]}"
}
sorting_results