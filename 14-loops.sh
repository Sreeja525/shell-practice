#!/bin/bash

USERID=$( id -u )
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/var/log/shellscript-logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
echo "creating $LOGS_FOLDER"
PACKAGE=("mysql" "nginx" "Python3" "httpd")


mkdir -p $LOGS_FOLDER #It creates parent directories as needed (e.g., if /var/log/myapp/logs doesn’t exist, it will create the full path).
echo "script started executed at : $(date)" | tee -a  $LOG_FILE 

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR: Please run with root access $N"
    exit 1
else    
    echo -e "$G you are running with root access $N"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then    
        echo -e "$G you have successfuly installed $2 $N "
    else
        echo  -e " $R installing $2 is failure $N"
    fi
}

for  package in ${PACKAGE[@]}
do
    dnf list installed $PACKAGE &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo -e " $Y $PACKAGE is not installed.. going to install it $N"
        dnf install $PACKAGE -y
        VALIDATE $? "$PACKAGE"
    else
        echo -e " $G $PACKAGE is already installed $N"
    fi
done