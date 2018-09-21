#!/bin/bash
echo "input a file name : "
read filename
#echo $filename

# var=$(stat -c %Y $filename)
# var='stat -c %Y $filename' 错误写法。。。

# 判断文件存不存在，如果不存在直接结束shell脚本，
# ×××××注意[]判断是一定要加两个空格。。不然报错
if [ ! -f $filename ];
 then
 	echo "文件不存在"
 	exit 0
 fi
#正确写法
fileTime=$(stat -c %Y $filename) 
nowTime=$(date +%s)
nowDay=$(date +%d)

#if($now)
begin_Day=$(date -d "-$nowDay day" +%s )
echo "文件修改时间:" $fileTime
echo "现在时间：" $nowTime
echo "月初时间：" $begin_Day

#因为文件在月初零点零时零秒创建大概率极低..所以不考虑这种情况
[ $fileTime -gt  $begin_Day ]&&{
		echo $fileName "是常用文件或目录"
}

[ $fileTime -lt  $begin_Day ]&&{
		echo $fileName "一个月前有修改"
}
