#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# '修改默认IP'

sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate


# '修改默认主机名'
sed -i 's/OpenWrt/GDOCK/g' package/base-files/files/bin/config_generate


#修改默认无线名称
sed -i 's/OpenWrt/KKT/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#修改默认无线加密及密码
sed -i 's/set wireless.default_radio${devidx}.encryption=none/set wireless.default_radio${devidx}.encryption=psk2 \set wireless.default_radio${devidx}.key=abc5124937,/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh


# '删除旧版主题文件
rm -rf package/lean/luci-theme-argon


#  '添加新的主题包'
git clone https://github.com/sypopo/luci-theme-argon-mc.git package/lean/luci-theme-argon-mc
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/YL2209/luci-theme-argon-lr.git package/lean/luci-theme-argon-lr

#'修改WIFI国家区域'
sed -i 's/US/CN/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# '修改输出文件名'
sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=$(shell date +%Y%m%d)-$(VERSION_DIST_SANITIZED)/g' include/image.mk

# '修改连接数数'
sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# '修改概览里时间显示为中文数字'
sed -i 's/os.date()/os.date("%Y年%m月%d日") .. " " .. translate(os.date("%A")) .. " " .. os.date("%X")/g' package/lean/autocore/files/arm/index.htm

