#include "prefsRootListController.h"

@implementation prefsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}


-(void) donateSickKids {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.redcross.ca/donate"]];
}

-(void) donateRedCross {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.canadahelps.org/en/charities/sickkids-foundation-the-hospital-for-sick-children-foundation-sick-kids-foundation/"]];
}

-(void) closeSnapchat {
	system("killall Snapchat");
}

@end