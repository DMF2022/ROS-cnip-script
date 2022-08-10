# ROS-cnip-script
#此列表搬运自kiddin9 / china_ip_list

https://github.com/kiddin9/china_ip_list

#此列表仅包含IPV4，没有IPV6

#自动修改为ROS脚本文件，每天凌晨1点更新

#加入了10.0.0.0/8，192.168.0.0/16,172.16.0.0/12三个内网网段，使内网不走标记路由

#加入了自动删除旧规则指令，导入新列表前会先搜索名为“CNIP”的列表并全部删除

#附：ROS自动拉取这个列表并导入的脚本（搬运自恩山论坛，自己做了一些修改），请确保ROS已经可以正常访问github，要不然fetch是拉不到这个文件的。


/tool fetch url=https://raw.githubusercontent.com/DMF2022/ROS-cnip-script/main/CNIP.rsc

/system logging disable 0

#/ip firewall address-list remove [find list="CNIP"]

/import file-name=cnip.rsc

/system logging enable 0

:local CNIP [:len [/ip firewall address-list find list="CNIP"]]

/file remove [find name="cnip.rsc"]

:log info ("CNIP列表更新:"."$CNIP"."条规则")

#下载这个IP列表文件

#临时关闭日志避免日志爆炸

#先删掉旧列表避免重复，这个指令和脚本里面的重复了，注释掉了

#导入新列表

#恢复日志正常输出

#查看当前列表数量

#删除IP列表文件

#写入日志
