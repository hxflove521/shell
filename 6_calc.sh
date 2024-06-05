#!/usr/bin/bash
#

# 
print_usage(){
	printf "Please enter an integer\n"
	
	#退出码
	exit 1
}

# 接收用户输入,存入到firstnum
read -p "Please input your number:" firstNum

# 判断
# -n 参数  如果字符串为空，条件不成立，如果不为空，条件成立
# sed 替换所有数字为空，判断是否还有字符
if [ -n "`echo ${firstNum} | sed 's/[0-9]//g'`" ]
then
	print_usage
fi

#判断成功，不存在非数字字符
read -p "Please input your operator:(+,-,*,/)"  operator

if [ "${operator}" != "+" ] &&  [ "${operator}" != "-" ] && [ "${operator}" != "*" ] && [ "${operator}" != "/" ]
then 
	printf "只允许输入+-*/"
	exit 2
fi

read -p "Please input your number:" secNum

if [ -n "`echo ${firstNum} | sed 's/[0-9]//g'`" ]
then
	print_usage
fi

echo "${firstNum}${operator}${secNum}="$((${firstNum}${operator}${secNum}))

#执行函数
#print_usage
