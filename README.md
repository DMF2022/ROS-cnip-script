# ROS-cnip-script
#此列表搬运自kiddin9 / china_ip_list

https://github.com/kiddin9/china_ip_list

此列表仅包含IPV4，没有IPV6，自动修改为ROS脚本文件，每天凌晨1点更新。

附：ROS自动拉取这个列表并导入的脚本（搬运自恩山论坛，自己做了一些修改），请确保ROS已经可以正常访问github，要不然fetch是拉不到这个文件的。

以下为ROS脚本：

/tool fetch url=https://raw.githubusercontent.com/DMF2022/ROS-cnip-script/main/cnip.rsc

/system logging disable 0

/ip firewall address-list remove [find list="CNIP"]

/import cnip.rsc

/system logging enable 0

:local CNIP [:len [/ip firewall address-list find list="CNIP"]]

/file remove [find name="cnip.rsc"]

:log info ("CNIP列表更新:"."$CNIP"."条规则")
