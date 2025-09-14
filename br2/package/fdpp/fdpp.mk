FDPP_VERSION = master
FDPP_SITE = https://github.com/dosemu2/fdpp
FDPP_SITE_METHOD = git
FDPP_LICENSE = GPL-3.0+
FDPP_LICENSE_FILES = LICENSE
FDPP_INSTALL_STAGING = YES

FDPP_DEPENDENCIES += host-pkgconf host-nasm-segelf thunk_gen elfutils
FDPP_CONF_OPTS = --cross-file $(FDPP_DIR)/fdpp/kernel/toolchain.ini

$(eval $(meson-package))
