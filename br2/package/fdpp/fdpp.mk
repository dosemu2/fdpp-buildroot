FDPP_VERSION = 1.0
FDPP_SITE = https://github.com/dosemu2/fdpp
FDPP_LICENSE = GPL-3.0+
FDPP_LICENSE_FILES = LICENSE
FDPP_INSTALL_STAGING = YES

FDPP_DEPENDENCIES += elfutils

define FDPP_BUILD_CMDS
    cd $(@D) && $$fdpp_SRCDIR/configure && $(MAKE) PREFIX=/usr CXX=$(TARGET_CXX)
endef

define FDPP_INSTALL_STAGING_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(STAGING_DIR) PREFIX=/usr
endef

define FDPP_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) PREFIX=/usr
endef

$(eval $(generic-package))
