COMCOM64_VERSION = 61e8e6b292a43bfc3311526049a4bf373c5b0e42
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
