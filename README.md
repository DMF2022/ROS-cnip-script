# ROS-cnip-script

此列表代码搬运自[kiddin9/china_ip_list](https://github.com/DMF2022/ROS-cnip-script)

IP地址库搬运自[纯真库](https://raw.githubusercontent.com/metowolf/iplist/master/data/special/china.txt)，[ipip](https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt)、[苍狼](https://ispip.clang.cn/all_cn.txt)三个IP列表，合并后加入ROS的导入命令制作而成。


>此列表仅包含IPV4地址，没有IPV6。

>自动修改为ROS脚本文件，每天凌晨1点更新。

>导入时自动搜索当前名为“CNIP”的IP列表并删除，避免交错冲突

>增加了192 172 10三个内网网段到CN列表，避免本地网络走标记路由

附：ROS导入脚本

>请确保ROS网络可以正常访问github。

###### 在/System Script下添加如下脚本内容
```
/tool fetch url=https://raw.githubusercontent.com/DMF2022/ROS-cnip-script/main/cnip.rsc
/system logging disable 0
/import cnip.rsc
/system logging enable 0
:local CNIP [:len [/ip firewall address-list find list="CNIP"]]
/file remove [find name="cnip.rsc"]
:log info ("CNIP列表更新:"."$CNIP"."条规则")
```
建议手动执行，也可以在/System Scheduler下添加一个脚本定时
