#!/bin/bash

USERID=$( id -u )
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/var/log/shellscript-logs
SCRIPT_NAME= $( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
echo "creating $LOGS_FOLDER"
sudo mkdir -p $LOGS_FOLDER

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
dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e " $Y mysql is not installed.. going to install it $N"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e " $G mysql is already installed $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo -e " $Y nginx is not installed.. going to install it $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e " $G nginx is already installed $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo -e "$Y python3 is not installed.. going to install it $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e " $G python3 is already installed $N"
fi