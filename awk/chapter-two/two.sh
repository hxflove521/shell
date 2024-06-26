#! /bin/bash
# 引用画线函数
source ../common/drawline.sh
# 字符串匹配模式
line
awk '/Asia/{print $0}' data/countries
echo "显式匹配"
awk '$4 ~ /Asia/{print $0}' data/countries
echo "显式不匹配"
awk '$4 !~ /Asia/{print $0}' data/countries
line
# 将 Asia 与 Europe 的人口数量累加
echo "打印Asia 与 Europe 这两个洲的总人口"
awk '/Asia/{pop[$4] += $3};/Europe/{pop[$4] += $3}END{print "Asia:",pop["Asia"],"\nEurope:",pop["Europe"]}' data/countries
echo "分别打印每个大洲的总人口数"
awk '{pop[$4] += $3}END{for(name in pop){print name, pop[name]} }' data/countries
line
# 按人口进行排序
echo "按人口进行排序，打印每个大洲的总人口数"
awk -F"\t" '{pop[$4] += $3}END{for(name in pop){printf("%15s\t%6d\n",name, pop[name] )|"sort -t'\t' -k2nr"}}' data/countries

