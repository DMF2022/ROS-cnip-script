/ip firewall address-list
remove [/ip firewall address-list find list=CNIP] list=CNIP
add address=(curl -kLfsm 5 https://ispip.clang.cn/all_cn.txt) list=CNIP
