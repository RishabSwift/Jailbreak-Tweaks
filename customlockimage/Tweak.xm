@interface SBLockScreenDateViewController
- (id)dateView;
@end

// @interface SBLockScreenManager
// - (id)sharedInstance;
// @end

// @interface SBLockScreenView
// @end

// @interface SBLockScreenViewController
// @end

%hook SBLockScreenDateViewController

- (void)_updateView {
	%orig;

	NSDate *dummyDate = [[self dateView] date];

	// check if the dummy date is 4:20
	NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
	timeFormatter.dateFormat = @"hh:mm";

	if ([[timeFormatter stringFromDate:dummyDate] isEqualToString:@"10:15"]) {
		// YES: set background to snoop dogg

		%log(@"SHIT BRO");

		// SBLockScreenDateViewController *lockViewController = MSHookIvar<SBLockScreenDateViewController *>([%c(SBLockScreenManager) sharedInstance], "_lockScreenViewController");

		// SBLockScreenView *lockView = MSHookIvar<SBLockScreenView *>(lockViewController, "_view");

		// UIView *neededView = MSHookIvar<UIView *>(lockView, "_foregroundView");

		// NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Library/MobileSubstrate/DynamicLibraries/com.rishabswift.customlockimage.bundle"];
		// UIImageView *snoop = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[bundle pathForResource:@"snoop" ofType:@"png"]]];
		
		// [snoop setFrame:neededView.frame];
		// [neededView insertSubview:snoop atIndex:0];

	} 

}

%end