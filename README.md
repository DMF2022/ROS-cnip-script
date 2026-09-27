# ROS-cnip-script

用于生成 MikroTik RouterOS 可直接导入的中国大陆 IP 地址列表。

IPv4 / IPv6 地址数据来自 **苍狼山庄 IPIP.NET 数据库**：

https://ispip.clang.cn/

GitHub Actions 每日自动获取最新 IP 列表，并转换为 RouterOS `.rsc` 脚本文件。

目前生成以下列表：

* `cnip.rsc`：中国大陆全部 IPv4
* `ct.rsc`：中国电信 IPv4
* `cu.rsc`：中国联通 IPv4
* `cmcc.rsc`：中国移动 IPv4
* `cnip6.rsc`：中国大陆 IPv6

同时会在导入前清空对应的旧地址列表，避免新旧 IP 数据交叉。

## ROS 导入

在 `/System → Scripts` 下添加以下脚本：

```rsc
/tool fetch url=https://cdn.jsdelivr.net/gh/DMF2022/ROS-cnip-script/cnip.rsc
/system logging disable 0
/import cnip.rsc
/system logging enable 0
:local CNIP [:len [/ip firewall address-list find list="CNIP"]]
/file remove [find name="cnip.rsc"]
:log info ("CNIP列表更新:"."$CNIP"."条规则")
```

手动执行该脚本即可更新 `CNIP` 地址列表。

也可以在 `/System → Scheduler` 中设置定时执行。

## 数据源

中国大陆 IPv4：

https://ispip.clang.cn/all_cn.txt

中国大陆 IPv6：

https://ispip.clang.cn/all_cn_ipv6.txt

中国电信：

https://ispip.clang.cn/chinatelecom.txt

中国联通：

https://ispip.clang.cn/unicom_cnc.txt

中国移动：

https://ispip.clang.cn/cmcc.txt

## 说明

本项目仅负责将 IP 数据转换成 RouterOS 地址列表导入脚本，IP 数据本身由上游数据源提供。

GitHub Actions 会自动检查数据变化，只有列表发生变化时才提交更新。
