#!/bin/bash

echo "All variables passed to the script: $@ "
echo "number of variable passed to the script: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "user running this script: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"