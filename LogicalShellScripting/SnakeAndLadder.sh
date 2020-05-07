#!/bin/bash -x

#usecase1
board(){
    startpos=0
    endpos=100
}

#usecase2
dieroll(){
    dienumber=$((RANDOM%6 + 1))
}

#usecase3
playerposition(){
    moveCheck=$(($RANDOM%3))
  if [ $((playerpos + dienumber)) -gt $endpos ]
  then
    playerpos=$playerpos
  else  
  	if [ $moveCheck -eq 0 ]
  	then
  		if [ $playerpos -gt $dienumber ]        #Snake
  		then
             playerpos=$(($playerpos - $dienumber))
             echo $playerpos
  		fi
  	elif [ $moveCheck -eq 1 ]
  	then
  	    playerpos=$playerpos                     #No Play
  	    echo $playerpos
  	else
     	   playerpos=$(($playerpos + $dienumber))    	#ladder
     	   echo $playerpos
  	fi
  fi    
}

#usecase4 
checkforwin(){
    board 
    playerpos=$startpos
    dieroll
    timesdierolled=0
    while [ $playerpos -lt $endpos ]
    do
       playerposition
       timesdierolled=$((timesdierolled + 1))
    done  
    echo $timesdierolled 
}

checkforwin

