#!/bin/bash

NUMBER= $1


#-gt greater than
#-lt less than
#-eq equal
#-ne not equal

if [ $NUMBER -lt 10 ] 
then 
    echo " given number is less than 10"
else
    echo "given number is greater than 10"
fi
