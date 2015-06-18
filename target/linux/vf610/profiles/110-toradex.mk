#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/COLIBRI_VF
  NAME:=Toradex Colibri VFxx family
  PACKAGES:= \
	kmod-usb-chipidea-imx kmod-usb-mxs-phy \
	kmod-can kmod-can-flexcan kmod-can-raw
endef

define Profile/COLIBRI_VF/Description
 Toradex Colibri VF50 and VF61 Computer on Module products are based on
 Freescale Vybrid SoC
endef

COLIBRI_VF_DTS:= \
	vf500-colibri-eval-v3 \
	vf610-colibri-eval-v3 \

$(eval $(call Profile,COLIBRI_VF))
