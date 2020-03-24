#!/bin/bash -x
#constant variable
NO_OF_SIMULATION=10
#variable
hCount=0
tCount=0
#initiatilizing a dictionary
declare -A dictionary
echo "Welcome a in flip coin simulation"
#function to flip coin
function flipCoin(){
   local randomFlip=$((RANDOM%2))
   if [ $randomFlip -eq 1 ] ;
   then
      echo "Heads"
   else
      echo "Tails"
   fi
}

#one coin simulation
for(( i=1;i<=NO_OF_SIMULATION;i++ ))
do
	coin=$(flipCoin)
	if [ $coin = "Heads" ]
	then
		(( hCount++ ))
	else
		(( tCount++ ))
	fi
done

dictionary[1]=$hCount #store head count in dictionary
dictionary[2]=$tCount #store tail count in dictionary

echo "${!dictionary[@]}" value="${dictionary[@]}"
#percentage of heads and tails
hPercentage=`echo "scale=2; ($hCount/$NO_OF_SIMULATION)*100" | bc` #singlet head percentange
tPercentage=`echo "scale=2; ($tCount/$NO_OF_SIMULATION)*100" | bc` #singlet tails percentahe
