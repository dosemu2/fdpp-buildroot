DOSEMU2_VERSION = 2.0
DOSEMU2_SITE = https://github.com/dosemu2/dosemu2
DOSEMU2_AUTORECONF = YES
DOSEMU2_AUTORECONF_OPTS = -I m4 --install --force

define DOSEMU2_DEVICES
    /dev/kvm  c  666  root  kvm  10  232  -  -  -
endef

$(eval $(autotools-package))
