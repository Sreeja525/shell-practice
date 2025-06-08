#!/bin/bash

USERID=$( id -u )
if [ $USERID -ne 0 ]
then 
    echo "ERROR: Please run with root access"
    exit 1
else    
    echo "you are running with root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -eq 0 ]
    then    
        echo "you have successfuly installed mysql"
    else
        echo " installing mysql is failure"
    fi
else
    echo " mysql is already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    dnf install nginx -y
    if [ $? -eq 0 ]
    then    
        echo "you have successfuly installed nginx"
    else
        echo " installing nginx is failure"
    fi
else
    echo " nginx is already installed"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    dnf install python3 -y
    if [ $? -eq 0 ]
    then    
        echo "you have successfuly installed python3"
    else
        echo " installing python3 is failure"
    fi
else
    echo " python3 is already installed"
fi

