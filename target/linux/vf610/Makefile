#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=vf610
BOARDNAME:=Freescale Vybrid
FEATURES:=audio display fpu gpio rtc usb usbgadget squashfs targz nand ubifs
CPU_TYPE:=cortex-a5
CPU_SUBTYPE:=neon
MAINTAINER:=Stefan Agner <stefan@agner.ch>

KERNEL_PATCHVER:=4.0
KERNELNAME:=zImage dtbs

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools

$(eval $(call BuildTarget))
