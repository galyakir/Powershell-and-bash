#!/bin/bash

# <description>
# This script will validate if a password is a strong passowrd.
#Strong password:
#1. Length – minimum of 10 characters.
#2. Contain both alphabet and number.
#3. Include both the small and capital case letters.
#* password: Specifies the password  to check.



password=$1
len=${#password}



function print_output () {

	#<description>
	# This function print the output with the correct message for each case.
	# Output will be red if the passowrd is weak with exit code 1; green with exit code 0 otherwise
   if [ $1 == 1 ]; then
   echo $(tput setaf 1) $2
   exit 1
   fi
   echo $(tput setaf 2) $2
   exit 0
}

if [ $len -lt 10 ]; then
  print_output 1  "Password is smaller than 10 characters"
fi

if [[ $password == *[[:digit:]]* ]] &&
   [[ $password == *[[:alpha:]]* ]]
then
     if [[ $password == *[[:upper:]]* ]] && [[ $password == *[[:lower:]]* ]]; then
		print_output 0 "This is a strong password"
   else
		print_output 1 "Password must contain upper and lower case"
   fi
else
		print_output 1 "Password must contain digit and letters"
fi