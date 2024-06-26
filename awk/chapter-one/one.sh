# 打印出工作时间超过零小时的员工的姓名和工资（薪资乘以时间）
awk '$3 > 0 {print $1, $2 * $3}' data/emp.data
# 打印出还没工作过的员工的姓名
echo "-----------------------------------------"
awk '$3 == 0 {print $1, $2 * $3}' data/emp.data
# 可以使用 NR 和 $0 给 emp.data 的没一行加上行号:
echo "-----------------------------------------"
echo "可以使用 NR 和 $0 给 emp.data 的没一行加上行号:"
awk '{print NR,$0}' data/emp.data
# 格式化输出
echo "-----------------------------------------"
echo "格式化输出"
awk '{print "需要支付给",$1,"的工资是：", $2 * $3}' data/emp.data
# 格式化输出2
echo "-----------------------------------------"
echo "格式化输出2"
awk '{printf("需要支付给 %-6s 的工资是：$%6.2f\n", $1, $2 * $3)}' data/emp.data
# 格式化输出3
echo "-----------------------------------------"
echo "格式化输出3"
awk '{printf("需要支付给 %-6s 的工资是：$ %6.2f\n", $1, $2 * $3)}' data/emp.data | sort -nk4r
# 对比选择 选择每小时赚5美元或更多的员工记录
echo "-----------------------------------------"
echo "选择每小时赚5美元或更多的员工记录"
awk '$2 >= 5{print $0}' data/emp.data
# 计算选择 打印出总薪资超过50美元的员工的薪酬。
echo "-----------------------------------------"
echo "打印出总薪资超过50美元的员工的薪酬。"
awk '$2 * $3 >= 50 {print $0," ", $2 * $3}' data/emp.data
# 文本内容选择
echo "-----------------------------------------"
echo "打印所有第一个字段为 Susie 的行"
awk '$1 == "Susie"{print $0}' data/emp.data
echo "-----------------------------------------"
awk '/Susie/{print $0}' data/emp.data
# 组合模式
echo "-----------------------------------------"
echo "打印(第二个字段) 大于等于 4 或者(第三个字段) 大于等于 20 的行"
awk '$2>=4 || $3 >= 20{print $0}' data/emp.data
# BEGIN与END
echo "-----------------------------------------"
echo "使用 BEGIN 来输出一个标题"
awk 'BEGIN {print "Name    Rate    Hours";print ""} { print }' data/emp.data

# AWK计算
echo "-----------------------------------------"
echo "统计工作超过15个小时的员工的数目"
awk '$3 > 15 {emp = emp + 1}END{print emp}' data/emp.data

# 计算薪酬均值的程序

echo "-----------------------------------------"
echo "计算薪酬均值的程序"
awk '{sum = sum + $3*$2}END{print "员工数:" NR ;print "工资总额：" sum;print "平均工资:" sum/NR}' data/emp.data

# 处理文本 

echo "-----------------------------------------"
echo "找出时薪最高的,只会找出了一个，如果有相同最高的话"
awk '$2 > maxrate { maxrate = $2;maxemp = $1 }END{ print "时薪最大的员工是：",maxemp, ",时薪是:"maxrate }' data/emp.data

# 字符串连接

echo "-----------------------------------------"
echo "将所有员工的姓名收集进单个字符串中"
# 字符串的变量的默认初始值是空字符串
awk '{names = names $1 " "}END{print names}' data/emp.data

# 打印最后一个输入行
echo "-----------------------------------------"
echo "打印最后一个输入行"
awk '{last = $0}END{print last}' data/emp.data

# 行、单词以及字符的计数
echo "-----------------------------------------"
echo "行、单词以及字符的计数"
# $0 并不包含每个输入行的末尾的换行符，所以我们要另外加个1
awk '{nc = nc + length($0) + 1;nw = nw + NF;} END {print NR,"行，";print nw,"个词语。";print nc, "个字符，"}' data/emp.data

# 控制语句 if-else
echo "-----------------------------------------"
echo "控制语句 if-else : 计算时薪超过6美元的员工的总薪酬与平均薪酬"
awk '$2 > 6{ sum = sum + $2 * $3;count = count + 1 }END{if(count >0) {print "总薪酬：",sum; print "平均薪酬：",sum/count;} else {print "没有时薪大于6的员工"}}' data/emp.data

# 控制语句 while语句
echo "-----------------------------------------"
echo "控制语句 while语句 : 计算时薪超过6美元的员工的总薪酬与平均薪酬"
echo "awk -f interest1 执行"

# 数组
echo "-----------------------------------------"
echo "按行逆序打印输入"
echo "awk -f array < data/emp.data"

