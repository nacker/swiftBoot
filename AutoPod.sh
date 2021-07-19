#!/bin/bash

# 主要解决的问题：当网速慢或者使用的源很慢时，容易出现超时中断，这时需要手动去重新执行`pod insatll`。这个脚本主要是解决这个问题，当超时中断时，脚本会自动帮你重新执行`pod insatll`命令。

### 可能还有坑要爬，其他大佬多帮忙优化优化 ###

# 使用方法：
# 1. 把AutoPod.sh放到与Podfile同一级目录，使用终端cd到Podfile所在目录下
# 2. 使用命令给脚本执行权限`chmod +x AutoPod.sh`（如果已经有权限，可以不用这一步）
# 3. 执行`./AutoPod.sh`

# 重试次数
count=0

trap 'onCtrlC' INT

function onCtrlC () {
	echo '手动退出'
	exit 130
}

if [ ! -f Podfile ]; then
	echo -e "\033[31mPodfile文件不存在！\033[0m"
	exit 1
fi

while true
do

pod install
if [ $? -ne 0 ]; then
	count=`expr $count + 1`
    echo -e "\033[35m第 $count 次尝试...\033[0m"
else
	echo -e "\033[47;30m 所有库都Pod完成，今天的码皇就是你🍻！！\033[0m"
	exit 0
fi

done



