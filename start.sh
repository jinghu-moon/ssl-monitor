# !/bin/bash
echo "========================================="
echo "注意："
echo "输入域名必须可以正常访问并显示内容。"
echo "否则，信息读取出错，部署的网站不显示域名的 SSL 信息。"
echo -e "\n"
echo "1、输入需要监测的域名。多个域名，用空格隔开。"
read -p "域名：" domains
echo -e "\n"
time1=$(date "+%Y-%m-%d %H:%M:%S")
now_time="$(date +%s -d "$time1")"
echo "2、开始访问网站，读取所需信息。"
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
echo "本次读取信息用时 ${use_time}s。"
echo "========================================="
echo "ssl.seeyue.top" > ./public/CNAME
