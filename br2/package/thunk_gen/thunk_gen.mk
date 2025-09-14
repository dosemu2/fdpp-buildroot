THUNK_GEN_VERSION = main
THUNK_GEN_SITE = https://github.com/stsp/thunk_gen
THUNK_GEN_SITE_METHOD = git
THUNK_GEN_LICENSE = GPL-3.0+
THUNK_GEN_LICENSE_FILES = LICENSE
THUNK_GEN_INSTALL_STAGING = YES

THUNK_GEN_DEPENDENCIES += host-flex host-bison host-autoconf
THUNK_GEN_INSTALL_TARGET_CMDS = true

$(eval $(meson-package))
