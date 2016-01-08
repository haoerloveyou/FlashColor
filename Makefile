TARGET = iphone:clang:latest:9.0
ARCHS = armv7 armv7s arm64 

include theos/makefiles/common.mk

AGGREGATE_NAME = FlashColor
SUBPROJECTS =  FlashColoriOS7 FlashColoriOS9

include $(THEOS_MAKE_PATH)/aggregate.mk

TWEAK_NAME = FlashColor
FlashColor_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
