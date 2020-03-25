#!/bin/bash -x

#start flip coin simulation for singlet, doublet
function startSimulate()
{
	read -p "do you want to flip the coin? if yes press 'y' otherwise press n for exit :  " flipping
	while [  $flipping == 'y' ]
	do
		read -p "How many times do you want to flips the coin? : " flipCoin
		echo -e "Which combination you want\nEnter your choice\n 1.Singlet\n 2.Doublet\n "
		read combination
		if [ $combination -eq 1 ]
		then
			simulate $flipCoin $combination
		elif [ $combination -eq 2 ]
		then
			simulate $flipCoin $combination
		else
				echo "Invalid Choice"
		fi
		read -p "Do you want to play again? if yes press 'y' otherwise press any key for exit : " flipping
	done
}

#flips coin and gerate the combination
function simulate()
{
	local flipCoin=$1
	local combination=$2
	
	#initializing a dictionary
	declare -A combinationCoin

	for((i=1;i<=flipCoin;i++))
	do
		flipCoinSides=""
		for((j=1;j<=combination;j++))
		do
			if [[ $(( RANDOM % 2 )) -eq 1 ]];
			then
				flipCoinSides+="H"
			else
				flipCoinSides+="T"
			fi
		done
		combinationCoin[$flipCoinSides]=$((${combinationCoin[$flipCoinSides]}+1))
	done
	combinationPercentage
}

#calculate percentage of each combination 
function combinationPercentage
{
	echo "Combination  :  Percentage "
	for i in ${!combinationCoin[@]}
	do
		combinationCoin[$i]=$(( combinationCoin[$i]*100/flipCoin ))
		echo $i"    "${combinationCoin[$i]}	
	done
}

#Start the flip coin Simulation
startSimulate
