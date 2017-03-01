include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = snapsspooferprefs
snapsspooferprefs_FILES = prefsRootListController.m
snapsspooferprefs_INSTALL_PATH = /Library/PreferenceBundles
snapsspooferprefs_FRAMEWORKS = UIKit
snapsspooferprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/snapsspooferprefs.plist$(ECHO_END)
