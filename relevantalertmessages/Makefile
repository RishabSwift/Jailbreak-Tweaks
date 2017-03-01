ARCHS = armv7 arm64
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RelevantAlertMessages
RelevantAlertMessages_FILES = Tweak.xm

RelevantAlertMessages_FRAMEWORK = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
