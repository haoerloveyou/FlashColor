GO_EASY_ON_ME = 1
SDKVERSION = 9.0:7.0
ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = FlashColor
FlashColor_FILES = FlashColor.mm
FlashColor_INSTALL_PATH = /Library/PreferenceBundles
FlashColor_FRAMEWORKS = UIKit
FlashColor_LIBRARIES = colorpicker
FlashColor_CFLAGS = -fno-objc-arc
FlashColor_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FlashColor.plist$(ECHO_END)
