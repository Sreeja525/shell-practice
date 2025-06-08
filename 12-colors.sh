USERID=$( id -u )
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
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
        echo "$G you have successfuly installed $2 $N "
    else
        echo " installing $2 is failure"
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e " $Y mysql is not installed.. going to install it $N"
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