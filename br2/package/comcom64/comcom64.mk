COMCOM64_VERSION = master
COMCOM64_SITE = https://github.com/dosemu2/comcom64
COMCOM64_SITE_METHOD = git
COMCOM64_LICENSE = GPL-3.0+
COMCOM64_LICENSE_FILES = LICENSE

define COMCOM64_BUILD_CMDS
    cd $(@D) && make fetch
endef
define COMCOM64_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) PREFIX=/usr
endef

$(eval $(generic-package))
