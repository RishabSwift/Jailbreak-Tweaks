ARCHS = armv7 arm64
DEBUG = 0
PACKAGE_VERSION=1.0
TARGET = iphone:10.2:10.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SnapSpoofer
SnapSpoofer_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk


SUBPROJECTS += snapsspooferprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
