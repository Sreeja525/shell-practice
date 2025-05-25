#!/bin/bash

num=1
MOVIES=("Court" "HIT3" "PUSHPA2" "Thandel")
for i in "${MOVIES[@]}"; do
    
    echo "Movie number $num is: $i"
    ((num++))
done