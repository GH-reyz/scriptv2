#!/bin/bash
clear
red='\e[1;31m'
white='\e[1;37m'
bred='\e[0;47;30m'
green='\e[0;32m'
blue='\e[0;34m'
blue_b='\e[0;94m'
purple='\e[1;35m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
IZIN=$(curl https://raw.githubusercontent.com/GH-reyz/GH-reyzv2/main/registerv2 | grep $MYIP | awk '{print $4}')
if [ $MYIP = $IZIN ]; then
    echo -e ""
    clear
else
  echo -e ""
    echo -e "${green}ACCESS DENIED...PM TELEGRAM OWNER${NC}"
    exit 1
fi
echo -e " "
IPVPS=$(curl -s icanhazip.com)
DOMAIN=$(cat /etc/v2ray/domain)
cekxray="$(openssl x509 -dates -noout < /etc/v2ray/v2ray.crt)"                                      
expxray=$(echo "${cekxray}" | grep 'notAfter=' | cut -f2 -d=)
name=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $IPVPS | awk '{print $2}')
city=$(curl -s https://ipinfo.io/json | grep -o 'city": "[^"]*' | grep -o '[^"]*$')
TIME=$(curl -sS ip-api.com | grep -w "timezone" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf)
ISP=$(curl -sS ip-api.com | grep -w "isp" | awk '{print $3,$4,$5,$6,$7,$8,$9}' | cut -d'"' -f2 | cut -d',' -f1 | tee -a /etc/afak.conf)
up=$(uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')
cpu_usage+=" %"
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
exp=$(curl -sS https://raw.githubusercontent.com/GH-reyz/GH-reyzv2/main/registerv2 | grep $IPVPS | awk '{print $3}')


echo -e  " ${red}   ____                      _    ____ __ " 
echo -e  "   / __ \___  __  ______     | |  / / // / " 
echo -e  "  / /_/ / _ \/ / / /_  /_____| | / / // /_ " 
echo -e  " / _, _/  __/ /_/ / / //_____/ |/ /__  __/ " 
echo -e  "/_/ |_|\___/\__, / /___/     |___/  /_/    "
echo -e  "           /____/                      "  
echo -e  " ${red}Premium Script"
echo -e  " ${red}═════════════════════════════════════════════════════════════════ " 
echo -e  " ${bred}                      • SERVER INFORMATION •                     "${NC}
echo -e  " ${red}═════════════════════════════════════════════════════════════════ " 
echo -e  " ${red}CPU MODEL                   : $cname"
echo -e  " ${red}NUMBER OF CORES             : $cores"
echo -e  " ${red}CPU USAGE                   : $cpu_usage1 %"
echo -e  " ${red}TOTAL RAM                   : $tram MB"
echo -e  " ${red}USED RAM                    : $uram MB"
echo -e  " ${red}FREE RAM                    : $fram MB"
echo -e  " ${red}SYSTEM UPTIME               : $up"
echo -e  " ${red}ISP/PROVIDER NAME           : $ISP"
echo -e  " ${red}CITY LOCATION               : $city${NC}"
echo -e  " ${red}TIME LOCATION               : $TIME"
echo -e  " ${red}VPS TYPE                    : PREMIUM"
echo -e  " ${red}IP VPS NUMBER               : $IPVPS${NC}"
echo -e  " ${red}DOMAIN                      : $DOMAIN${NC}"
echo -e  " ${red}SCRIPT VERSION              : REYZ-V4 (V2)"
echo -e  " ${red}OS VERSION                  : `hostnamectl | grep "Operating System" | cut -d ' ' -f5-`"${NC}
echo -e  " ${red}KERNEL VERSION              : `uname -r`${NC}"
echo -e  " ${red}EXP DATE CERT V2RAY/XRAY    : $expxray${NC}"
echo -e  " ${red}CLIENT NAME                 : $name${NC}"
echo -e  " ${red}EXP SCRIPT ACCSESS          : $exp${NC}"
echo -e  " ${red}CONTACT TELEGRAM            : @GHReyz" 
echo -e  " ${red}═════════════════════════════════════════════════════════════════ " 
echo -e  " ${bred}                         • MAIN MENU •                           "${NC}                                      
echo -e  " ${red}═════════════════════════════════════════════════════════════════ " 
echo -e  " ${red}[  1 ] SSH & OPENVPN                   [  7 ] TROJAN GFW" 
echo -e  " ${red}[  2 ] WIREGUARD                       [  8 ] REBOOT SERVER"
echo -e  " ${red}[  3 ] SHADOWSOCKS R                   [  9 ] UPDATE SCRIPT" 
echo -e  " ${red}[  4 ] SHADOWSOCKS OBFS                [ 10 ] SYSTEM MENU"
echo -e  " ${red}[  5 ] V2RAY CORE                      [ 11 ] CHANGE PASSWORD"
echo -e  " ${red}[  6 ] XRAY CORE                       [ 12 ] CHECK SYSTEM ERROR "
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "                           
echo -e  " ${red}[  0 ] EXIT MENU${NC} "
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "
echo -e  " ${white}Premium Script By Reyz-V4" 
echo -e  " ${white}Thank You For Using Script By Reyz-V4" 
echo -e  " ${red}═════════════════════════════════════════════════════════════════ "
echo -e  "  "
echo -e "\e[1;31m"
read -p  "     Please select an option :  " menu
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
   reboot
   ;;
   9)
   update
   ;;
   10)
   system
   ;;
   11)
   passwd
   12)
   checksystem 
   ;;     
   0)
   sleep 0.5
   clear
   exit
   clear
   ;;
   *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   menu
   ;;
   esac
