#!/bin/bash
#=================================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'

# Disable opkg signature check
sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf

# Add build date to index page
# export orig_version="$(cat "/etc/openwrt_release" | grep DISTRIB_DESCRIPTION | awk -F "'" '{print $2}')"
# sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" /etc/openwrt_release

# Add execute permission for ipv6-helper
chmod +x /bin/ipv6-helper
chmod +x /bin/cpuinfo

sed -i '/Load Average/i\\t\t<tr><td width="33%"><%:CPU Temperature%></td><td><%=luci.sys.exec("cut -c1-2 /sys/class/thermal/thermal_zone0/temp")%><span>&#8451;</span></td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm
sed -i 's/pcdata(boardinfo.system or "?")/"R2S ARMv8 2021"/' /usr/lib/lua/luci/view/admin_status/index.htm

exit 0
