line(){
    # 分隔符
    str="-"
    # 获取屏幕宽度
    ScreenLen=$(stty size | awk '{print $2}')
    # 打印分割线
    yes ${str} | sed ''''${ScreenLen}'''q' | tr -d "\n" && echo
}