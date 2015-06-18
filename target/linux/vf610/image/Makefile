#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define sanitize_profile_name
$(shell echo $(PROFILE) | tr '[:upper:]' '[:lower:]' | sed 's/_/-/g')
endef

define Image/BuildKernel/Template

 ifneq ($(1),)
	$(CP) $(DTS_DIR)/$(1).dtb $(BIN_DIR)/$(IMG_PREFIX)-$(1).dtb
 endif

	$(CP) $(KDIR)/zImage $(BIN_DIR)/$(IMG_PREFIX)-zImage
endef

define Image/InstallKernel/Template

 ifneq ($(CONFIG_TARGET_ROOTFS_INCLUDE_KERNEL),)
	$(INSTALL_DIR) $(TARGET_DIR)/boot
   ifneq ($(CONFIG_TARGET_ROOTFS_INCLUDE_ZIMAGE),)
	$(CP) $(BIN_DIR)/$(IMG_PREFIX)-zImage $(TARGET_DIR)/boot/
	ln -sf $(IMG_PREFIX)-zImage $(TARGET_DIR)/boot/zImage
   endif
 endif

 ifneq ($(CONFIG_TARGET_ROOTFS_INCLUDE_DTB),)
	$(INSTALL_DIR) $(TARGET_DIR)/boot
	$(foreach dts,$(shell echo $(1)), \
		$(CP) $(BIN_DIR)/$(IMG_PREFIX)-$(dts).dtb $(TARGET_DIR)/boot/ ; \
		ln -sf $(IMG_PREFIX)-$(dts).dtb $(TARGET_DIR)/boot/$(dts).dtb ; \
	)
 endif
endef

define ubifs_vf610_toradex_colibri
	$(eval COLIBRI_VF_UBIFS_OPTS:="-m 2KiB -e 124KiB -c 8112")
	$(eval COLIBRI_VF_UBI_OPTS:="-m 2KiB -p 128KiB -s 2KiB")
	$(call Image/mkfs/ubifs)
	$(CP) $(KDIR)/root.ubifs $(BIN_DIR)/$(IMG_PREFIX)-$(call sanitize_profile_name)-rootfs.ubifs
	$(CP) $(KDIR)/root.ubi $(BIN_DIR)/$(IMG_PREFIX)-$(call sanitize_profile_name)-rootfs.ubi
endef

define Image/Build/ubifs
	true
endef

define Image/Build/ubi
	true
endef

Image/BuildKernel/Template/Generic=$(call Image/BuildKernel/Template)
Image/InstallKernel/Template/Generic=$(call Image/InstallKernel/Template)

Image/BuildKernel/Template/COLIBRI_VF=$(foreach dts,$(shell echo $(COLIBRI_VF_DTS)),$(call Image/BuildKernel/Template,$(dts)))
Image/InstallKernel/Template/COLIBRI_VF=$(call Image/InstallKernel/Template,$(COLIBRI_VF_DTS))
Image/ubifs/COLIBRI_VF=$(call ubifs_vf610_toradex_colibri)

define Image/BuildKernel
	$(call Image/BuildKernel/Template/$(PROFILE))
endef

define Image/InstallKernel
	$(call Image/InstallKernel/Template/$(PROFILE))
	$(if $(Image/ubifs/$(PROFILE)), \
		$(call Image/ubifs/$(PROFILE))
	)
endef

define Image/Build
	$(if $(Image/Build/$(1)), \
		$(call Image/Build/$(1),$(1)), \
		$(CP) $(KDIR)/root.$(1) $(BIN_DIR)/$(IMG_PREFIX)-$(call sanitize_profile_name)-$(1).img \
	)
endef

$(eval $(call BuildImage))
