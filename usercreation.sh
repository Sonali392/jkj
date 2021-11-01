#!/bin/bash
USERNAME=$1
if [ $# -eq 0 ]; then
    echo "please enter vaild input"
else
    if [[ $USERNAME =~ ^[a-zA-Z]+$ ]]; then
        exuser=$(cat /etc/passwd | grep -w $USERNAME | cut -d ":" -f 1)
        if [ "${USERNAME}" = "${exuser}" ]; then
            echo "$username already exists"
        else
            echo "Lets create user"
            useradd -m $USERNAME
            spec='!@#$%^&*()_'
            spechar=$(echo $spec | fold -w1 | shuf | head -1)
            PASSWORD=India@${RANDOM}${spechar}
            echo "$USERNAME:$PASSWORD" | sudo chpasswd
            passwd --expire $USERNAME
            echo "The username is $USERNAME and the password is $PASSWORD"
        fi
    else
        echo "invalid"
    fi
fi
