#!/bin/bash -x

#usecase 1
readinputs(){
    read -p "Enter stake amount" stake
    read -p "Enter betting amount for game " betamount
}

#usecase 2
gambling(){
    checkWinLoss=$((RANDOM%2))
	if [ $checkWinLoss -eq 0 ]
	then
		money=$(($money + $betamount ))
	else
		money=$(($money - $betamount))
	fi
}

#usecase 3
daydetails(){
    winGoal=$((stake + $((money/2))))
    lossGoal=$((stake - $((money/2))))
    while [ $money -gt $lossGoal ] && [ $money -lt $winGoal ]
	do
	   gambling
	done
}

#usecase 4,5,6,7
noofdays(){
    readinputs
    read -p "Enter no of days" noofdays
    totalAmount=$((stake*noofdays))
    amountAchieved=0
    totaldayswon=0
    totaldayslost=0
    for (( day=1; day<=noofdays ; day++ ))
    do
       money=$stake
       daydetails
       
       if [ $money -gt $stake ]
       then
        totaldayswon=$((totaldayswon+1))
        echo "day"$day "won" $((money-stake))
       else  
        totaldayslost=$((totaldayslost+1))
        echo "day"$day "loose" $((stake-money))
       fi  
       
       amountAchieved=$((amountAchieved+money))
    done  
    
    if [ $totalAmount -lt $amountAchieved ]
    then
        echo "won" + $((amountAchieved - totalAmount))
    elif [ $totalAmount -eq $amountAchieved ]
    then
        echo "draw"
    else        
        echo "loose" + $((totalAmount - amountAchieved ))
    fi  
    
    echo "totldayswon" $totaldayswon
    echo "totaldayslost" $totaldayslost
    
    if [ $totaldayswon -gt $totaldayslost ]
    then
	    echo "play next month"
    else
    	echo "stop playing"
    fi	
    
}
noofdays