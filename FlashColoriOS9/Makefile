GO_EASY_ON_ME = 1
SDKVERSION = 8.0
ARCHS = armv7 arm64

include ../theos/makefiles/common.mk

TWEAK_NAME = FlashColoriOS9
FlashColoriOS9_FILES = Tweak.xm
FlashColoriOS9_FRAMEWORKS = CoreGraphics UIKit
FlashColoriOS9_INSTALL_PATH = /Library/Application Support/FlashColor

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += ../FlashColor
include $(THEOS_MAKE_PATH)/aggregate.mk