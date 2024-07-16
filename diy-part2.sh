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

# 移除要替换的包
rm -rf feeds/luci/themes/luci-theme-argon
# Themes
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
# 添加额外插件
#git clone https://github.com/xsj520/filebrowser package/luci-app-filebrowser
#git clone https://github.com/xsj520/istore-ui package/luci-app-istore-ui
# Modify default IP
sed -i 's/192.168.1.1/192.168.1.100/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
# 修改插件名字
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"iStore"/"商店"/g' `grep "iStore" -rl ./`
sed -i 's/"Docker"/"容器"/g' `grep "Docker" -rl ./`
sed -i 's/"TTYD 终端"/"TTYD端"/g' `grep "TTYD 终端" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"存储卷"/"卷标"/g' `grep "存储卷" -rl ./`
