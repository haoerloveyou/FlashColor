#import <Preferences/Preferences.h>

@interface FlashColorListController: PSListController {
}
@end

@implementation FlashColorListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FlashColor" target:self] retain];
	}
	return _specifiers;
}

-(void) killSpringBoard {
	system("/usr/bin/killall -9 SpringBoard");
}

- (void)viewWillAppear:(BOOL)animated
{
	[self clearCache];
	[self reload];
	[super viewWillAppear:animated];
}
@end
// vim:ft=objc
