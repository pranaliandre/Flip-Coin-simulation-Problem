#!/bin/bash -x
echo "Welcome in flip coin simulation"
#function to flip coin
function flipCoin(){
   local randomFlip=$((RANDOM%2))
   if [ $randomFlip -eq 1 ] ;
   then
      echo Heads
   else
      echo Tails
   fi
}
#one coin simulation
flipCoin


