include $(THEOS)/makefiles/common.mk

TWEAK_NAME = test
test_FILES = Tweak.xm

TARGET = simulator:clang:latest:7.0
test_USE_SUBSTRATE = 0

test_FRAMEWORK = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
