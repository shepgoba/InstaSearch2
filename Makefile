INSTALL_TARGET_PROCESSES = Instagram
ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = instasearch2

instasearch2_FILES = instasearch2.xm
SHARED_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
