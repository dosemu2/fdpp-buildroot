DOSEMU2_VERSION = 2.0
DOSEMU2_SITE = https://github.com/dosemu2/dosemu2
DOSEMU2_USERS = dosemu2 -1 dosemu2 -1 - /home/dosemu2 /bin/bash cdrom,lock,video,input,audio,kvm dosemu2_user
DOSEMU2_AUTORECONF = YES
DOSEMU2_AUTORECONF_OPTS = -I m4 --install --force
DOSEMU2_CONF_OPTS = --disable-searpc

# mandatory deps
DOSEMU2_DEPENDENCIES += host-flex host-bison host-pkgconf libbsd fdpp
# optional deps
ifeq ($(BR2_PACKAGE_JSON_C),y)
    DOSEMU2_DEPENDENCIES += json-c
endif
ifeq ($(BR2_PACKAGE_SLANG),y)
    DOSEMU2_DEPENDENCIES += slang
endif
ifeq ($(BR2_PACKAGE_LIBAO),y)
    DOSEMU2_DEPENDENCIES += libao
endif
ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
    DOSEMU2_DEPENDENCIES += alsa-lib
endif
ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
    DOSEMU2_DEPENDENCIES += fluidsynth
endif
ifeq ($(BR2_PACKAGE_GPM),y)
    DOSEMU2_DEPENDENCIES += gpm
endif
ifeq ($(BR2_PACKAGE_SDL2),y)
    DOSEMU2_DEPENDENCIES += sdl2
endif
ifeq ($(BR2_PACKAGE_SDL2_TTF),y)
    DOSEMU2_DEPENDENCIES += sdl2_ttf
endif
ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
    DOSEMU2_DEPENDENCIES += fontconfig
endif
ifeq ($(BR2_PACKAGE_READLINE),y)
    DOSEMU2_DEPENDENCIES += readline
endif

$(eval $(autotools-package))
