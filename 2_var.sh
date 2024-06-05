#!/usr/bin/bash
#

echo '特殊变量$0 $1 $2 ..的实践'
echo '结果：'$0 $1 $2

echo '########################'
echo '特殊变量$#,获取参数总个数'
echo $#

echo '########################'
echo '特殊变量$*,'
echo '结果：'$*

echo '########################'
echo '特殊变量$@'
echo '结果：'$@

echo '比较$* --- $@'

echo '$*演示'
for var in "$*"
do
	echo $var
done

echo '$@演示'
for var in "$@"
do
	echo $var
done

name='laoda'

echo ${name:3}
