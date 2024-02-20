#!/bin/bash
ISP=$(cat /root/.isp)
CITY=$(cat /root/.city)
NC='\033[0m'
PURPLE='\033[0;35m'
WHITES="\033[97;1m"
clear
function lane() {
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
}
y="\033[1;93m"
g="\033[1;92m"
blue="\033[0;96m"
ungu='\033[0;35m'
RED="\033[31m"
u="\033[0;36m"
NC="\e[0m"
xdxlgaris="───────────────────"
function garis() {
echo -e "${blue}————————————————————————————————————————${NC}"
}
function Credit_Sc() {
sleep 1
echo -e ""
garis 
echo -e "${ungu}      Terimakasih sudah menggunakan-"
echo -e "        Script premium by Effata Tunneling"
garis
echo -e ""
exit 0
}
function add_noobzvpn() {
clear
garis
echo -e "${ungu}         CREATE NOOBZ VPN ACCOUNT        ${NC}"
garis
read -p "   Username : " user
read -p "   Password : " Pass
read -p "   Expired (Days) : " masaaktif
domain=$(cat /etc/xray/domain)
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

noobzvpns --add-user ${user} ${Pass} --expired-user ${user} ${masaaktif}

DATADB=$(cat /etc/noobzvpns/.noobzvpns.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/noobzvpns/.noobzvpns.db
fi

echo "### ${user} ${exp} ${Pass}" >>/etc/noobzvpns/.noobzvpns.db

cat > /var/www/html/noobzvpns-$user.txt <<-END
${xdxlgaris}
Format Noobzvpns Account
${xdxlgaris}
Username          : $user
Password          : $Pass
${xdxlgaris}
IP                : $IP
ISP               : $ISP
CITY              : $CITY
Host/Ip           : $domain

Port Noozvpns SSL : 443
Port Noozvpns     : 80
Pubkey           : $serverpub
${xdxlgaris}
Payload Websocket NTLS: 
GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
${xdxlgaris}
Payload Websocket TLS: 
GET wss://bug.com/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
${xdxlgaris}
Created          : $tnggl
Expired          : $expe
${xdxlgaris}

END

clear
garis
echo -e "${ungu}           NOOBVPNS ACCOUNT             ${NC}"
garis
echo -e "Username          : $user"
echo -e "Password          : $Pass"
garis
echo -e "IP                : $IP"
echo -e "ISP               : $ISP"
echo -e "CITY              : $CITY"
echo -e "Host/Ip           : $domain"
echo -e "Port NoobzVpn SSL : 443"
echo -e "Port NoobzVpn     : 80"
garis
echo -e "Save Link Account: https://$domain:81/noobzvpns-$user.txt"
garis
echo -e "Payload nTLS:"
echo -e "GET / HTTP/1.1[crlf]host: ${domain}[crlf]Upgrade: Websocket[crlf][crlf]"
garis
echo -e "Payload  TLS:"
echo -e "GET http://bug.con/ HTTP/1.1[crlf]host: ${domain}[crlf]Upgrade: Websocket[crlf][crlf]"
garis
echo -e "Created On       : $tnggl"
echo -e "Expired On       : $expe"
garis
Credit_Sc
}

function trial_noobzvpn() {
clear
garis
echo -e "${ungu}         CREATE NOOBZ VPN ACCOUNT        ${NC}"
garis
read -p "   Sett Expired ( minutes ) : " masaaktif
#read -p "   Username : " user
#read -p "   Password : " Pass
#read -p "   Expired (Days) : " masaaktif
user=t`</dev/urandom tr -dc a-z0-9 | head -c7`
Pass=1
domain=$(cat /etc/xray/domain)
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

noobzvpns --add-user ${user} ${Pass} --expired-user ${user} ${masaaktif}

cat > /var/www/html/noobzvpns-$user.txt <<-END
${xdxlgaris}
Format Noobzvpns Account
${xdxlgaris}
Username          : $user
Password          : $Pass
${xdxlgaris}
IP                : $IP
ISP               : $ISP
CITY              : $CITY
Host/Ip           : $domain

Port Noozvpns SSL : 443
Port Noozvpns     : 80
Pubkey           : $serverpub
${xdxlgaris}
Payload Websocket nTLS: 
GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
${xdxlgaris}
Payload Websocket TLS: 
GET wss://bug.com/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
${xdxlgaris}
Created          : $tnggl
Expired          : $expe
${xdxlgaris}

END

clear
garis
echo -e "${ungu}           NOOBVPNS ACCOUNT             ${NC}"
garis
echo -e "Username          : $user"
echo -e "Password          : $Pass"
garis
echo -e "IP                : $IP"
echo -e "ISP               : $ISP"
echo -e "CITY              : $CITY"
echo -e "Host/Ip           : $domain"
echo -e "Port NoobzVpn SSL : 443"
echo -e "Port NoobzVpn     : 80"
garis
echo -e "Save Link Account: https://$domain:81/noobzvpns-$user.txt"
garis
echo -e "Payload nTLS:"
echo -e "GET / HTTP/1.1[crlf]host: ${domain}[crlf]Upgrade: Websocket[crlf][crlf]"
garis
echo -e "Payload  TLS:"
echo -e "GET http://bug.con/ HTTP/1.1[crlf]host: ${domain}[crlf]Upgrade: Websocket[crlf][crlf]"
garis
echo -e "  Expired On     : $masaaktif Minutes"
garis
echo "z9dtrial noobz \"$user\"" | at now + $masaaktif minutes &> /dev/null
Credit_Sc
}

function renew_noobz() {
clear
lane
echo -e "${PURPLE}               MEMBER NOOBZ                 ${PURPLE} "
lane
echo -e "${WHITES}NO     USERNAME          EXP DATE          ${NC}"
lane
noobzvpns --info-all-user
lane
echo -e "${PURPLE}             RENEW NOOBZ ACCOUNT                   ${NC}"
lane
echo ""
read -p "Input username Account: " user
clear
noobzvpns --renew-user ${user}
systemctl restart noobzvpns
}

function member_noobz() {
clear
lane
echo -e "${PURPLE}               MEMBER NOOBZ                 ${PURPLE} "
lane
echo -e "${WHITES}NO     USERNAME          EXP DATE          ${NC}"
lane
noobzvpns --info-all-user | awk '/^\s*\+.*-> active/ {gsub(/(issued\(yyyymmdd\)|hash_key): [0-9a-f]+/, ""); print; getline; print; getline; getline; getline; print;}'
lane
}

function del_noobz() {
clear
lane
echo -e "${PURPLE}               MEMBER NOOBZ                 ${PURPLE} "
lane
echo -e "${WHITES}NO     USERNAME          EXP DATE          ${NC}"
lane
noobzvpns --info-all-user
lane
echo -e "${PURPLE}            DELETE NOOBZ ACCOUNT                   ${NC}"
lane
echo ""
read -p "Input username Account: " user
clear
noobzvpns --remove-user ${user}
sed -i "/^### $user/d" /etc/noobzvpns/.noobzvpns.db
rm -rf /var/www/html/noobzvpns-${user}.txt
systemctl restart noobzvpns
}

function locked_noobz() {
clear
lane
echo -e "${PURPLE}               MEMBER NOOBZ                 ${PURPLE} "
lane
echo -e "${WHITES}NO     USERNAME          EXP DATE          ${NC}"
lane
noobzvpns --info-all-user
lane
echo -e "${PURPLE}            LOCKED NOOBZ ACCOUNT                   ${NC}"
lane
echo ""
read -p "Input username Account: " user
clear
noobzvpns --block-user ${user}
systemctl restart noobzvpns
}

function unlocked_noobz() {
clear
lane
echo -e "${PURPLE}               MEMBER NOOBZ                 ${PURPLE} "
lane
echo -e "${WHITES}NO     USERNAME          EXP DATE          ${NC}"
lane
noobzvpns --info-all-user
lane
echo -e "${PURPLE}           UNLOCKED NOOBZ ACCOUNT                  ${NC}"
lane
echo ""
read -p "Input username Account: " user
clear
noobzvpns --unblock-user ${user}
systemctl restart noobzvpns
}

function chnge_passwd_noobz() {
clear
lane
echo -e "${PURPLE}               MEMBER NOOBZ                 ${PURPLE} "
lane
echo -e "${WHITES}NO     USERNAME          EXP DATE          ${NC}"
lane
noobzvpns --info-all-user
lane
echo -e "${PURPLE}            CHANGE NOOBZ ACCOUNT                   ${NC}"
lane
echo ""
read -p "Input username Account: " user
read -p "Input new passwd Account: " pass
clear
noobzvpns --password-user ${user} ${pass}
systemctl restart noobzvpns
}

function rename_noobz() {
clear
lane
echo -e "${PURPLE}               MEMBER NOOBZ                 ${PURPLE} "
lane
echo -e "${WHITES}NO     USERNAME          EXP DATE          ${NC}"
lane
noobzvpns --info-all-user
lane
echo -e "${PURPLE}            RENAME NOOBZ ACCOUNT                   ${NC}"
lane
echo ""
read -p "Input Old username Account: " old_user
read -p "Input new username Account: " new_user
clear
noobzvpns --rename-user ${old_user} ${new_user}
systemctl restart noobzvpns
}

function garis_atas() {
echo -e "${y}┌──────────────────────────────────────────┐${NC}"
}
function garis_bawah() {
echo -e "${y}└──────────────────────────────────────────┘${NC}"
}
xdxl="${y}│${NC}${g} "
clear
garis_atas
echo -e "${y}│${NC}             ${g}MENU NOOBZ VPNS${NC}              ${y}│$NC"
garis_bawah
garis_atas
echo -e "${xdxl} 1.${NC}$u Create NoobzVpn Account${NC}"
echo -e "${xdxl} 2.${NC}$u Create Trial NoobzVpn Account${NC}"
echo -e "${xdxl} 3.${NC}$u Delete NoobzVpn Account${NC}"
echo -e "${xdxl} 4.${NC}$u Renew NoobzVpn Account${NC}"
echo -e "${xdxl} 5.${NC}$u Member NoobzVpn Account${NC}"
echo -e "${xdxl} 6.${NC}$u Rename User NoobzVpn Account${NC}"
echo -e "${xdxl} 7.${NC}$u Change Passwd User NoobVpn Account${NC}"
echo -e "${xdxl} 8.${NC}$u Locked NoobzVpn Account${NC}"
echo -e "${xdxl} 9.${NC}$u Unlocked NoobzVpn Account${NC}"
echo -e "${xdxl}10.${NC}$u Remove All User NoobzVpn Account ${NC}"
echo -e "${xdxl} 0.${NC}$u Back to menu${NC}"
garis_bawah
echo -e ""
read -p "Select From Options [ 1 - 10 or 0 ] : " menu
case $menu in
0) menu ;;
1) add_noobzvpn ;;
2) trial_noobzvpn ;;
3) del_noobz ;;
4) renew_noobz ;;
5) member_noobz ;;
6) rename_noobz ;;
7) chnge_passwd_noobz ;;
8) locked_noobz ;;
9) unlocked_noobz ;;
10) remove_alluser ;;
esac
