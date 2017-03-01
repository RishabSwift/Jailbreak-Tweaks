ARCHS = armv7 arm64
DEBUG = 0
PACKAGE_VERSION=1.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoHandwrittenMessage
NoHandwrittenMessage_FILES = Tweak.xm
ShowMeHerName_PRIVATE_FRAMEWORKS = ChatKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
