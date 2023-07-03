#!/bin/bash
##版本：V2.1.1
#新功能，支持更新优选完毕后推送至TG，再也不怕脚本没有成功运行了。
#使用脚本需要安装jq和timeout，新增openwrt专用cf_RE.sh文件，运行cf_RE.sh即可在openwrt安装jq和timeout两个扩展。
#其他linux请自行安装jq和timeout。
###################################################################################################
##运行模式ipv4 or ipv6 默认为：ipv4
#指定工作模式为ipv4还是ipv6。如果为ipv6，请在文件夹下添加ipv6.txt
#ipv6.txt在CloudflareST工具包里，下载地址：https://github.com/XIU2/CloudflareSpeedTest/releases
IP_ADDR=ipv4
###################################################################################################
##cloudflare配置
#cloudflare账号邮箱
x_email=替换邮箱
#填写需要DDNS的完整域名
#支持多域名:域名需要填写在括号中，每个域名之间用“空格”相隔。
#例如：（cdn.test.com） 或者 （cdn1.test.com cdn2.test.com cdn3.test.com）
hostname=(域名1 域名2)
#空间ID
zone_id=替换空间id
#Global API Key
api_key=替换Global API Key
###################################################################################################
##openwrt科学上网插件配置
#优选节点时是否自动停止科学上网服务 true=自动停止 false=不停止 默认为 true
pause=true
#填写openwrt使用的是哪个科学上网客户端，填写对应的“数字”  默认为 1  客户端为passwall
# 1=passwall 2=passwall2 3=ShadowSocksR Plus+ 4=clash 5=openclash 6=bypass
clien=3
#####################################################################################################
##TG推送设置
#（填写即为开启推送，未填写则为不开启）
#TG机器人token 例如：123456789:ABCDEFG...
telegramBotToken=
#用户ID或频道、群ID 例如：123456789
telegramBotUserId=
#
##PushPlus设置
# PushPlus说明（https://www.pushplus.plus/）
# --token码--
PushPlusToken=
#
##Server 酱推送设置
# Server 酱推送说明（https://sct.ftqq.com/）
# --token码--
ServerSendKey=
#
##pushdeer推送设置
# PushDeer推送说明（http://www.pushdeer.com/product.html）
# --token码--
PushDeerPushKey=
#
##企业微信推送设置
# 企业ID
#（https://developer.work.weixin.qq.com/document/path/90665#corpid）
CORPID=
#
# 应用ID
# (https://developer.work.weixin.qq.com/document/path/90665#secret)
SECRET=
#
# agentid
#	(https://developer.work.weixin.qq.com/document/path/90665#agentid)
AGENTID=
#
# 成员ID
# (https://developer.work.weixin.qq.com/document/path/90665#userid)
# 设置需要推送给谁，不填写默认推送给全员
USERID=
#
# 企业微信推送代理域名
# 由于企业微信限制推送需要ip白名单，但家里的网络一般不是固定ip，所以需要自建反向代理API域名，将反向代理服务器的ip加入企业微信的ip白名单
Proxy_WX=
#
##Synology Chat推送
# 使用群晖的chat套件进行推送，下方填写群晖chat中-整合-传入的webhook中，的Webhook URL地址。
Synology_Chat_URL=""
#
#####################################################################################################
source cf_ddns
