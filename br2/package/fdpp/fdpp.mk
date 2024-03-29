FDPP_VERSION = 1.0
FDPP_SITE = https://github.com/dosemu2/fdpp
FDPP_LICENSE = GPL-3.0+
FDPP_LICENSE_FILES = LICENSE
FDPP_INSTALL_STAGING = YES

FDPP_DEPENDENCIES += host-flex host-bison host-pkgconf elfutils

define FDPP_BUILD_CMDS
    cd $(@D) && $$fdpp_SRCDIR/configure
    $(MAKE) -C $(@D) PREFIX=/usr \
        CXX_LD=$(TARGET_CXX) \
        CC_LD=$(TARGET_CC) \
        CC_FOR_BUILD=$(HOSTCC) \
        BISON="$(HOST_DIR)/bin/bison" \
        LEX="$(HOST_DIR)/bin/flex" \
        PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY) \
        CROSS_LD=$(HOSTLD)
endef

define FDPP_INSTALL_STAGING_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(STAGING_DIR) PREFIX=/usr
endef

define FDPP_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) PREFIX=/usr
endef

$(eval $(generic-package))
