#!/bin/bash
clear
red='\e[1;31m'
green='\e[1;33m'
NC='\e[0m'
ok='\e[0;m'

echo -e  " ${red}=========================================================================="
echo -e  " ${}                                  SYSTEM MENU "                                                                                                  
echo -e  " ${red}=========================================================================="
echo -e  " ${red}[  1 ] ADD/CHANGE DOMAIN VPS           [  2 ] CHANGE PORT SERVICE"
echo -e  " [ 3 ] CHANGE DNS SERVER               [ 4 ] RENEW CERTIFICATION"
echo -e  " [ 5 ] WEBMIN MENU                     [ 6 ] CHECK RAM USAGE"
echo -e  " [ 7 ] SPEEDTEST VPS                   [ 8 ] CHECK GEO LOCATION "
echo -e  " [ 9 ] SYSTEM INFORMATION              [ 10] BANDWIDTH SERVER"
echo -e "=========================================================================="
echo -e "${red}[ 0 ] EXIT TO MENU"
echo -e "=========================================================================="
echo -e "Click [ CTRL + C ] Or X For Exit"
echo -e  "  "
echo -e "\e[1;31m"
read -p  "     Please select an option :  " v2raycore
echo -e "\e[0m"
case $v2raycore in
   1)
   add-host
   ;;
   2)
   change
   ;;
   3)
   mdns
   ;;
   4)
   recert-xrayv2ray
   ;;
   5)
   wbmn
   ;;
   6)
   ram
   ;;
   7)
   speedtest
   ;; 
   8)
    nf
   ;;  
   10)
   vnstat
   ;;
   9)
   info
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
   mv2raycore
   ;;
   esac
