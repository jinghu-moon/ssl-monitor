# !/bin/bash
time1=$(date "+%Y-%m-%d %H:%M:%S")
now_time="$(date +%s -d "$time1")"
echo "【注意】：输入的域名必须是可以访问且能显示内容的。否则，读取信息会出现错误，部署网站不会显示域名的 SSL 信息。"
echo -e "\n"
echo "1、请输入需要监测的域名。多个域名，请用空格隔开。"
read -p "域名：" domains
echo -e "\n"
echo "2、开始访问网站，读取所需信息。需要一定时间，请耐心等待。"
rm -rf public
mkdir public
cd check-ssl
chmod +x ./checker.sh
source ./checker.sh ${domains}
cp -r ./output/ct.json ../public/ct.json
rm -rf output
cd ..
cp -r ./src/index.html ./public/index.html
echo -e "\n"
echo "3、信息读取成功，脚本执行完毕！"
time2=$(date "+%Y-%m-%d %H:%M:%S")
end_time="$(date +%s -d "$time2")"
use_time=$((($end_time-$now_time)/1))
echo -e "\n"
echo "本次读取信息耗时 ${use_time}s。"
echo "ssl.seeyue.top" > ./public/CNAME
