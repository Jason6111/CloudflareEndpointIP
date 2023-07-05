# CloudflareEndpointIP
openwrt优选对端IP定时上传CF和dnspod
# 食用说明
v0.0.1  
1.下载[CloudflareEndpointIP](https://github.com/Jason6111/CloudflareEndpointIP/releases/download/0.0.1/CloudflareEndpointIP-0.0.1.zip)  
2.将以上两个放到一个文件夹里上传到openwrt  
3.安装所需插件`bash``jq``coreutils-timeout`  
4.ssh连接openwrt进入对应目录chmod +x CloudflareST赋予权限  
5.vi ip.sh 填写对应信息  
5.1.点击网站-域名-区域ID-概述-右下角的区域ID  
5.2.点击获取你的令牌-找到Global API Key-点击查看-验证密码后-将获取到的API密钥填入配置文件  
6.bash ip.sh运行测试  
7.openwrt设置定时计划例如`6 0 * * * cd /mnt/nvme0n1p4/ip && bash ip.sh`

v0.0.2  
1.下载[CloudflareEndpointIP](https://github.com/Jason6111/CloudflareEndpointIP/releases/download/0.0.2/CloudflareEndpointIP-0.0.2.zip)并上传openwrt  
2.设置config.conf  
3.bash start.sh运行测试  
4.openwrt设置定时计划例如`6 0 * * * cd /mnt/nvme0n1p4/ip && bash start.sh`
# 达成效果  
![image](demo/IMG.jpg) 
