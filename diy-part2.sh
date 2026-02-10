#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate


# 1. 修改主机名为 My-Router
sed -i 's/hostname='OpenWrt'/hostname='USB-Server'/g' package/base-files/files/bin/config_generate

# 2. 修改默认 SSID 为 My-WiFi
sed -i 's/ssid=OpenWrt/ssid=USB-Server/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 3. 默认开启无线
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
ed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio${devidx}.encryption=psk2/a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ set wireless.default_radio${devidx}.key=12345678' package/kernel/mac80211/files/lib/wifi/mac80211.sh

chmod 775 files/etc/init.d/vhusbd
chmod 775 files/usr/bin/vhusbd
