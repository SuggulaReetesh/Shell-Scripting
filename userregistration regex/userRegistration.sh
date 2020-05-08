#!/bin/bash -x
shopt -s extglob

function validateFirstName(){

	echo "enter your name"
	read firstName
	pattern=^[A-Z][a-z]{3,}

	if [[ $firstName =~ $pattern ]]
	then
		echo "valid first name"
	else 
		echo "invalid first name"
	fi 
}
validateFirstName

function validateLastName(){

	echo "enter your last name"
	read lastName
	pattern=^[A-Z][a-z]{3,}

	if [[ $lastName =~ $pattern ]]
	then
		echo "valid last  name"
	else
		echo "invalid last  name"
	fi
}
validateLastName

function validateEmail(){

	 echo "enter your email"
	 read email
	
	pattern="^[a-zA-Z0-9]*+([._-+])?[a-zA-Z0-9]*@[a-zA-Z]+.[a-zA-Z]{2,4}(.[a-zA-Z]{2})*$"

	if [[ $email =~ $pattern ]]
	then
 	echo "valid email"
 	else
 	echo "invalid email"
	fi
}
validateEmail
function validateMobileNo(){

	echo "enter your Mobile no with country code"
    read mobileNo
	pattern="^[1-9]{2}[[:space:]]{1}[0-9]{10}$"

	if [[ $mobileNo =~ $pattern ]]
	then
	echo "valid mobile no"
	else
	echo "invalid mobile no"
	fi
}
validateMobileNo
function validatePassword(){
	
	read -p "please enter password:" password
	count=`echo ${#password}`
	
	if [[ $count -ne 8 ]]
	then
		echo "Password length should be 8 charactore"
	exit 1;
	fi
	
	pattern="^[A-Za-z0-9]*[@#$%^&*][0-9a-zA-Z]*$"

	if [[ $password =~ $pattern ]]
	then
		echo "Password is valid"
	else
		echo "Password Must contain upparcase ,lowecase,number and special charactor"
	fi
}
validatePassword