#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/VF610_COLIBRI
  NAME:=Toradex Colibri VFxx family
  PACKAGES:= \
	kmod-usb-chipidea-imx kmod-usb-mxs-phy \
	kmod-can kmod-can-flexcan kmod-can-raw
endef

define Profile/VF610_COLIBRI/Description
 Toradex Colibri VF50 and VF61 Computer on Module products are based on
 Freescale Vybrid SoC
endef

$(eval $(call Profile,VF610_COLIBRI))
