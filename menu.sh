#!/bin/bash
clear
red='\e[1;35m'
bred1='\e[45m'
bred='\e[41m'
blue='\e[1;34m'
blue_b='\e[1;94m'
yellow='\e[1;33m'
purple='\e[1;31m'
white='\e[1;37m'
try='\e[0;103m'
cyan='\e[1;36m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com)
IZIN=$(curl https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $MYIP | awk '{print $4}')
if [ $MYIP = $IZIN ]; then
  echo -e ""
  clear
else
  echo -e ""
  echo -e "${green}ACCESS DENIED...PM TELEGRAM OWNER @GHReyz${NC}"
  exit 1
fi
echo -e " "
IPVPS=$(curl -s icanhazip.com)
DOMAIN=$(cat /etc/v2ray/domain)
city=$(curl -s https://ipinfo.io/json | grep -o 'city": "[^"]*' | grep -o '[^"]*$')
TIME=$(curl -sS ip-api.com | grep -w "timezone" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf)
ISP=$(curl -sS ip-api.com | grep -w "isp" | awk '{print $3,$4,$5,$6,$7,$8,$9}' | cut -d'"' -f2 | cut -d',' -f1 | tee -a /etc/afak.conf)
up=$(uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
cpu_usage+=" %"
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
cekxray="$(openssl x509 -dates -noout </etc/v2ray/v2ray.crt)"
expxray=$(echo "${cekxray}" | grep 'notAfter=' | cut -f2 -d=)
name=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $IPVPS | awk '{print $3}')
c_xtls=$(grep -oc '### [^ ]*' /etc/xray/vless-direct.json | cut -d' ' -f2)
c_xvmess=$(grep -oc '### [^ ]*' /etc/xray/v2ray-tls.json | cut -d' ' -f2)
c_xvless=$(grep -oc '### [^ ]*' /etc/xray/vless-tls.json | cut -d' ' -f2)
c_grpc=$(grep -oc '### [^ ]*' /etc/xray/vless-grpc.json | cut -d' ' -f2)
c_vmess=$(grep -oc '### [^ ]*' /etc/v2ray/config.json | cut -d' ' -f2)
c_vless=$(grep -oc '### [^ ]*' /etc/v2ray/vless.json | cut -d' ' -f2)
total_xray=$(($c_xtls + $c_xvmess + $c_xvless + $c_grpc))
total_v2ray=$(($c_vmess + $c_vless))
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
bulan=$(date +%b)
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /root/t1)" != '0' ]; then
  bulan=$(date +%b)
  month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
  month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $10}')
  month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
  month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $4}')
  month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
  month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $7}')
else
  bulan=$(date +%Y-%m)
  month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $8}')
  month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
  month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $2}')
  month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
  month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $5}')
  month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /root/t1)" != '0' ]; then
  yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
  yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
  yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
  yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
  yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
  yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
  yesterday=NULL
  yesterday_v=NULL
  yesterday_rx=NULL
  yesterday_rxv=NULL
  yesterday_tx=NULL
  yesterday_txv=NULL
fi
rm -f /root/t1
bash /root/.fontsam/banner
echo -e "  Premium Script" | lolcat
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${bred1}                      • SERVER INFORMATION •                     "${NC}
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${red}CPU MODEL                   :$cname"
echo -e " ${red}NUMBER OF CORES             : $cores"
echo -e " ${red}CPU USAGE                   : $cpu_usage1 %"
echo -e " ${red}CPU FREQUENCY               :$freq MHz"
echo -e " ${red}TOTAL AMOUNT OF RAM         : $tram MB"
echo -e " ${red}SYSTEM UPTIME               : $up"
echo -e " ${red}ISP/PROVIDER NAME           : $ISP"
echo -e " ${red}CITY LOCATION               : $city${NC}"
echo -e " ${red}TIME LOCATION               : $TIME"
echo -e " ${red}IP VPS NUMBER               : $IPVPS"
echo -e " ${red}DOMAIN NAME                 : $DOMAIN${NC}"
echo -e " ${red}VPS TYPE                    : PREMIUM"
echo -e " ${red}SCRIPT VERSION              : REYZ-V4 (V1)"
echo -e " ${red}CLIENT NAME                 : $name${NC}"
echo -e " ${red}EXP SCRIPT ACCSESS          : $exp${NC}"
echo -e " ${red}OS VERSION                  : $(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)"${NC}
echo -e " ${red}KERNEL VERSION              : $(uname -r)${NC}"
echo -e " ${red}EXP DATE CERT V2RAY/XRAY    : $expxray${NC}"
echo -e " ${red}TELEGRAM                    : @GHReyz"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " TRAFFIC           TODAY          YESTERDAY          MONTH" | lolcat
echo -e " ${white}UPLOAD            $today_tx $today_txv      $yesterday_tx $yesterday_txv         $month_tx $month_txv"
echo -e " DOWNLOAD          $today_rx $today_rxv      $yesterday_rx $yesterday_rxv         $month_rx $month_rxv"
echo -e " TOTAL             $today $today_v      $yesterday $yesterday_v         $month $month_v"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${cyan}TOTAL USER        SSH/OVPN          XRAY            V2RAY" | lolcat
echo -e " ${white}                     $total_ssh               $total_xray                $total_v2ray"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${bred}                         • MAIN MENU •                           "${NC}
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${purple}[  1 ] SSH & OPENVPN                  [  2 ] WIREGUARD"
echo -e " ${purple}[  3 ] SHADOWSOCKS R                  [  4 ] SHADOWSOCKS OBFS"
echo -e " ${purple}[  5 ] V2RAY CORE                     [  6 ] XRAY CORE"
echo -e " ${purple}[  7 ] TROJAN GFW                     [ 99 ] BANDWIDTH SERVER"
echo -e " ${yellow}════════════════════════════════════════════════════════════════="
echo -e " ${bred}                        • SYSTEM MENU •                          "${NC}
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${purple}[  8 ] ADD/CHANGE DOMAIN VPS          [  9 ] CHANGE PORT SERVICE"
echo -e " [ 10 ] CHANGE DNS SERVER              [ 11 ] RENEW CERTIFICATION"
echo -e " [ 12 ] WEBMIN MENU                    [ 13 ] CHECK RAM USAGE"
echo -e " [ 14 ] REBOOT VPS                     [ 15 ] SPEEDTEST VPS"
echo -e " [ 16 ] DISPLAY SYSTEM INFORMATION     [ 17 ] CHECK STREAM GEO"
echo -e " [ 18 ] CHANGE SCRIPT BANNER           [ 19 ] CHECK SERVICE ERROR"
echo -e " [ 20 ] UPDATE SCRIPT                  [  0 ] EXIT MENU${NC}"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${white}🔰 Premium Script By Reyz-V4 🔰"
echo -e " 🔰 Thank You For Using Script By Reyz-V4 🔰"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " "
echo -e "\e[1;37m"
read -p "     Please select an option :  " menu
echo -e " "
echo -e "\e[0m"
case $menu in
1)
  mssh
  ;;
2)
  mwg
  ;;
3)
  mssr
  ;;
4)
  mss
  ;;
5)
  mv2raycore
  ;;
6)
  mxraycore
  ;;
7)
  mtrojan
  ;;
8)
  add-host
  ;;
9)
  change
  ;;
10)
  mdns
  ;;
11)
  recert-xrayv2ray
  ;;
12)
  wbmn
  ;;
13)
  ram
  ;;
14)
  reboot
  ;;
15)
  speedtest
  ;;
16)
  info
  ;;
17)
  nf
  ;;
18)
  banner_changer
  ;;
19)
  checksystem
  ;;
20)
  update
  ;;
99)
  vnstat
  ;;
0)
  sleep 0.5
  clear
  jinggo
  ;;
*)
  echo -e "ERROR!! Please Enter an Correct Number"
  sleep 1
  clear
  menu
  ;;
esac
