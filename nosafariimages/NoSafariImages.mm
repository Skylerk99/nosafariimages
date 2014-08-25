#import <Preferences/Preferences.h>

@interface NoSafariImagesListController: PSListController {
}
@end

@implementation NoSafariImagesListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NoSafariImages" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
