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
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by xsj/g" package/lean/default-settings/files/zzz-default-settings

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
# 修改插件名字
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"iStore"/"商店"/g' `grep "iStore" -rl ./`
sed -i 's/"Docker"/"容器"/g' `grep "Docker" -rl ./`
sed -i 's/"存储卷"/"存储"/g' `grep "存储卷" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"TTYD 终端"/"终端命令"/g' `grep "TTYD 终端" -rl ./`
sed -i 's/"上网时间控制"/"上网控制"/g' `grep "上网时间控制" -rl ./`
sed -i 's/"启动项"/"启动项目"/g' `grep "启动项" -rl ./`
sed -i 's/"挂载点"/"挂载地点"/g' `grep "挂载点" -rl ./`
sed -i 's/"重启"/"重启开关"/g' `grep "重启" -rl ./`
sed -i 's/"ShadowSocksR Plus+"/"科学上网"/g' `grep "ShadowSocksR Plus+" -rl ./`
sed -i 's/"DHCP/DNS"/"DHCP/D"/g' `grep "DHCP/DNS" -rl ./`
sed -i 's/"防火墙"/"防火墙区"/g' `grep "防火墙" -rl ./`
sed -i 's/"主机名"/"主机名称"/g' `grep "主机名" -rl ./`
