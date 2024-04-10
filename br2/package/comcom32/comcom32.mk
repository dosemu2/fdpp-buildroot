COMCOM32_VERSION = 0.1
COMCOM32_SITE = https://github.com/dosemu2/comcom32
COMCOM32_LICENSE = GPL-3.0+
COMCOM32_LICENSE_FILES = LICENSE

define COMCOM32_BUILD_CMDS
    cd $(@D) && \
      curl -O https://dosemu2.github.io/comcom64/files/comcom32.zip && \
      unzip -u -o comcom32.zip
endef
define COMCOM32_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR) PREFIX=/usr
endef

$(eval $(generic-package))
