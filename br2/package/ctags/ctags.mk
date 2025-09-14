CTAGS_VERSION = master
CTAGS_SITE = https://github.com/universal-ctags/ctags
CTAGS_SITE_METHOD = git
CTAGS_LICENSE = GPL-2.0+
CTAGS_LICENSE_FILES = LICENSE
CTAGS_INSTALL_STAGING = YES
CTAGS_AUTORECONF = YES

$(eval $(autotools-package))
