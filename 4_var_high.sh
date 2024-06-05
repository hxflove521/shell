#!/usr/bin/bash
#
params='ss'

result=${a:-thisresult}

echo $result
echo $a

result1=${p:=equalresult}
echo $result1
echo $p

result2=${a:?变量不存在！}
echo $result2
