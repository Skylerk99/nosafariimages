ARCHS = armv7 arm64
TARGET = iphone:clang::
include theos/makefiles/common.mk

BUNDLE_NAME = ImageSwitch
ImageSwitch_FILES = Switch.x
ImageSwitch_FRAMEWORKS = UIKit
ImageSwitch_LIBRARIES = flipswitch
ImageSwitch_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk