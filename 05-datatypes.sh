#!/bin/bash

number1=2
number2=3

Timestamp=$(date)

echo "Script executed at: $Timestamp"
SUM=$(($number1+$number2))

echo "sum of $number1 and $number2 is $SUM"