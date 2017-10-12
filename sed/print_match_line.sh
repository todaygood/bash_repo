
文件data内容
my name is chngchng
yes i can
1、打印匹配行的方法
     sed -n -e '/my/p' data
         my name is chngchng
2、打印行号的方法
        sed -n -e '/my/=' data
        1
3、打印匹配行与行号的方法
    sed -n -e '/my/p' -e '/my/=' data 
    my name is chngchng 
    1

