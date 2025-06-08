#!/bin/bash

USERID=$( id -u )
R=  $(\e[31m)
if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR: Please run with root access"
    exit 1
else    
    echo "you are running with root access"
fi


VALIDATE(){
    if [ $1 -eq 0 ]
    then    
        echo "you have successfuly installed $2 "
    else
        echo " installing $2 is failure"
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo " mysql is not installed.. going to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo " mysql is already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo " nginx is not installed.. going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo " nginx is already installed"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo " python3 is not installed.. going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo " python3 is already installed"
fi