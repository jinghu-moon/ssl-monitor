# !/bin/bash
echo -e "\n"
echo "1、请输入需要监测的域名。多个域名，请用空格隔开。"
read -p "域名：" domains  #提示用户输入数字
# if [ -z $domains ];then             #判断用户是否输入，如果未输入则打印error
#   echo "Error"
#   exit
# arr=(${domains})
# for i in ${arr[@]}
# do
#     echo $i
# done
echo -e "\n"
echo "2、开始访问网站，读取所需信息。需要一定时间，请耐心等待。"
cd check-ssl
chmod +x ./checker.sh
DATE_Previous="$(echo $(date '+%Y-%m-%d %H:%M:%S'))"
DATE_current="$(echo $(date '+%Y %m %d %H:%M:%S'))"
now_time="$(date -d "$DATE_Pre" +%s)"
end_time="$(date -d "$expire_GMT" +%s)"
expireday=`expr $[expirestamp-nowstamp] / 86400`
source ./checker.sh ${domains}
# 复制 ct.json
# mkdir -p public

cp -r ./output/ct.json ../public/ct.json
cd ..
cp -r ./src/index.html ./public/index.html
echo -e "\n"
echo "3、信息读取成功，脚本执行完毕！"
# echo "ssl.seeyue.top" > ./public/CNAME
# img.seeyue.top jinghumoon.top