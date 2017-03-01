include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomLockImage
CustomLockImage_FILES = Tweak.xm

BUNDLE_NAME = com.rishabswift.customlockimage
com.rishabswift.customlockimage_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
