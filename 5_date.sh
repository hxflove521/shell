#!/usr/bin/bash
#
echo "这是当前时间：`date`"

echo "当前登录用户：" 
who
# 转义字符,双引号需要会执行$,单引号是文本字面意思
echo "当前价格\$699"
echo '当前价格$699'
