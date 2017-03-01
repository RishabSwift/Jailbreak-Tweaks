ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BetterMusicApp
BetterMusicApp_FILES = Tweak.xm
ShowMeHerName_PRIVATE_FRAMEWORKS = ChatKit

include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"