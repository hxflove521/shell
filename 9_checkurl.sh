#!/usr/bin/bash
#
# 引入系统预定义函数
. /lib/lsb/init-functions

function usage(){
    echo "Usage: $0 url"
    exit 1
}

function checkurl(){
    wget --spider -q -o /dev/null --tries=1 -T 5 $1

    if [ $? -eq 0 ]
    then
        log_success_msg echo "$1 is running..."
    else
        log_failure_msg echo "$1 is down..."
    fi
    exit 0
}


function main(){

    if [ "$#" -ne 1 ]
    then
        usage
    fi
# 执行检查函数
    checkurl $1

}

main $*
