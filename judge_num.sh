#! /bin/bash
#用于判断一个输入的数是不是整数，如果是则程序结束，如果不是整数则继续输入，知道输入的数为整数为止
flag=true
read -p "please input a number:" num
while $flag
do
   expr $num + 0 &>/dev/null
   [ $? -eq 0 ] && flag=false || read -p "please input a integer:" num
done
