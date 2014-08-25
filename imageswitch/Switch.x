#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#import <notify.h>
static NSString * const PREF_PATH = @"/var/mobile/Library/Preferences/com.skylerk99.nosafariimages.plist";
static NSString * const kSwitchKey = @"load";

@interface ImageSwitchSwitch : NSObject <FSSwitchDataSource>
@end

@implementation ImageSwitchSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:PREF_PATH];
    id existOpenTabBackground = [dict objectForKey:kSwitchKey];
    BOOL isOpenTabBackgroundEnabled = existOpenTabBackground ? [existOpenTabBackground boolValue] : YES;
    return isOpenTabBackgroundEnabled ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:PREF_PATH];
    NSMutableDictionary *mutableDict = dict ? [[dict mutableCopy] autorelease] : [NSMutableDictionary dictionary];
    switch (newState) {
        case FSSwitchStateIndeterminate:
            return;
        case FSSwitchStateOn:
            [mutableDict setValue:@YES forKey:kSwitchKey];
            break;
        case FSSwitchStateOff:
            [mutableDict setValue:@NO forKey:kSwitchKey];
            break;
    }
    [mutableDict writeToFile:PREF_PATH atomically:YES];
    notify_post("com.skylerk99.nosafariimages.settingschanged");
}

@end
