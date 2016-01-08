GO_EASY_ON_ME = 1
SDKVERSION = 7.0
ARCHS = armv7 arm64

include ../theos/makefiles/common.mk

TWEAK_NAME = FlashColoriOS7
FlashColoriOS7_FILES = Tweak.xm
FlashColoriOS7_FRAMEWORKS = CoreGraphics UIKit
FlashColoriOS7_INSTALL_PATH = /Library/Application Support/FlashColor

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += ../FlashColor
include $(THEOS_MAKE_PATH)/aggregate.mk