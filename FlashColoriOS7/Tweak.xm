#import <UIKit/UIKit.h>


#define kFlashColorSettings @"/var/mobile/Library/Preferences/com.cabralcole.flashcolor.plist"

static NSMutableDictionary *settings;
void refreshPrefs()
{
		if(kCFCoreFoundationVersionNumber >= 847.23){ // iOS 7.0

			[settings release];
			CFStringRef appID2 = CFSTR("com.cabralcole.flashcolor");
			CFArrayRef keyList = CFPreferencesCopyKeyList(appID2, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
			if(keyList)
			{
				settings = (NSMutableDictionary *)CFPreferencesCopyMultiple(keyList, appID2, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
				CFRelease(keyList);
			} else
			{
				settings = nil;
			}
		}
		else
		{
			[settings release];
			settings = [[NSMutableDictionary alloc] initWithContentsOfFile:[kFlashColorSettings stringByExpandingTildeInPath]]; //Load settings the old way.
	}
}

static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	system("killall SpringBoard");
	refreshPrefs();
}

%group main


%hook SBScreenFlash

- (void)flashColor:(id)arg1
{
	if(settings != nil && ([settings count] != 0) && [[settings objectForKey:@"enabled"] boolValue]) 
	{
		%orig;
		[MSHookIvar<UIView *>(self, "_flashView") setBackgroundColor:[self colorFromHex:[settings objectForKey:@"aColor"]]];
	}
	%orig;
}

%new
-(UIColor *)colorFromHex:(NSString *)hexString
{
    unsigned rgbValue = 0;
    if ([hexString hasPrefix:@"#"]) hexString = [hexString substringFromIndex:1];
    if (hexString) {
    NSArray *getAlpha = [hexString componentsSeparatedByString:@":"];

    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:0]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];

   return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:[[getAlpha objectAtIndex:1] floatValue]];

    }
	else return [UIColor whiteColor];
}
%end

%end

    %ctor {
	@autoreleasepool {
				settings = [[NSMutableDictionary alloc] initWithContentsOfFile:[kFlashColorSettings stringByExpandingTildeInPath]];
				CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR("com.cabralcole.flashcolor/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
				refreshPrefs();
		%init(main);
	}
}