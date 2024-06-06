#!/usr/bin/bash

#if [ -f /etc/hosts ]
##then
#    echo "[ ] It's ok!"
#fi

#if [[ -f /etc/hosts ]]
#then
#    echo "[[  ]] is ok!"
#fi

#if test -f /etc/hosts
#then
#    echo "test is ok!"
#fi

FreeMEM=`free -m|awk 'NR==2 {print $NF}'`
MESSAGE="Current memory is ${FreeMEM}"

if [ ${FreeMEM} -lt "2800" ]
then
    echo $MESSAGE|tee /tmp/message.txt
    echo "MEM is not enough"
fi
