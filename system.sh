#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

echo -e  " ${red}=========================================================================="
echo -e  "                                                SYSTEM MENU                                                                                                  "
echo -e  " ${red}=========================================================================="
echo -e  " [  1 ] ADD/CHANGE DOMAIN VPS"
echo -e  " [  2 ] CHANGE DNS SERVER"
echo -e  " [  3 ] RENEW V2RAY AND XRAY CERTIFICATION"
echo -e  " [  4 ] WEBMIN MENU"
echo -e  " [  5 ] CHECK RAM USAGE"
echo -e  " [  6 ] SPEEDTEST VPS"
echo -e  " [  7 ] DISPLAY SYSTEM INFORMATION"
echo -e  " [  8 ] CHECK STREAM GEO LOCATION"
echo -e  " [  9 ] BANDWIDTH USAGE"
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
    mdns
    ;;
    3)
    recert-xrayv2ray
    ;;
    4)
    wbmn
    ;;
    5)
    ram
    ;;
    6)
    speedtest
    ;;
    7)
    info
    ;;
    8)
    nf
    ;;
    9)
    vnstat
    ;;
    x)
    exit
    ;;
	0)
    sleep 0.5
    clear
    menu
    ;;
    *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   mv2raycore
   ;;
   esac