DOSEMU2_VERSION = 2.0
DOSEMU2_SITE = https://github.com/dosemu2/dosemu2
DOSEMU2_USERS = dosemu2 -1 dosemu2 -1 - /home/dosemu2 /bin/bash cdrom,lock,video,input,audio dosemu2_user
DOSEMU2_AUTORECONF = YES
DOSEMU2_AUTORECONF_OPTS = -I m4 --install --force

define DOSEMU2_DEVICES
    /dev/kvm  c  666  root  kvm  10  232  -  -  -
endef

$(eval $(autotools-package))
