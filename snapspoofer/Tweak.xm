@interface Story
	@property unsigned long long viewedCount; // @synthesize viewedCount=_viewedCount;
	@property unsigned long long viewedCountFriend; // @synthesize viewedCountFriend=_viewedCountFriend;
	@property unsigned long long viewedCountOther; // @synthesize viewedCountOther=_viewedCountOther;
	@property long long screenshotCount;
	@property unsigned long long screenshotCountFriend;
	@property unsigned long long screenshotCountOther;
	- (NSString *)getViewCountFormula;
	- (NSString *)getScreenshotCountFormula;
@end

	static BOOL enabled;
	static BOOL enableCustomViews;
	static BOOL enableCustomScreenshots;


	static void reloadSettings(){

		NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile:@"var/mobile/Library/Preferences/com.rishabswift.snapsspooferprefs.plist"];

		enabled = [prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : NO;

		enableCustomViews = [prefs objectForKey:@"customViewEnabled"] ? [[prefs objectForKey:@"customViewEnabled"] boolValue] : NO;

		enableCustomScreenshots = [prefs objectForKey:@"customScreenshotEnabled"] ? [[prefs objectForKey:@"customScreenshotEnabled"] boolValue] : NO;
	}


	%hook Story


	%new
	- (NSString *)getViewCountFormula
	{
		NSDictionary *settings = [[%c(NSDictionary) alloc] initWithContentsOfFile:@"var/mobile/Library/Preferences/com.rishabswift.snapsspooferprefs.plist"];
		NSString *viewSetting = (NSString *)[settings objectForKey:@"customViewCount"];
		if([viewSetting isEqualToString: @""]) return nil;
		else return viewSetting;
	}


	%new
	- (NSString *)getScreenshotCountFormula
	{
		NSDictionary *settings = [[%c(NSDictionary) alloc] initWithContentsOfFile:@"var/mobile/Library/Preferences/com.rishabswift.snapsspooferprefs.plist"];
		NSString *screenshotSetting = (NSString *)[settings objectForKey:@"customScreenshotCount"];
		if([screenshotSetting isEqualToString: @""]) return nil;
		else return screenshotSetting;
	}

	- (unsigned long long) viewedCount {

		unsigned long long originalViewCount = %orig;

		if (enabled && enableCustomViews && [self getViewCountFormula]) {

			// Check if the user entered formula is valid (e.g. doesn't contain alpha characters, random signs, etc)
			NSCharacterSet *allowed =  [[NSCharacterSet characterSetWithCharactersInString:@"i+./-*1234567890"] invertedSet];
			NSRange range = [[self getViewCountFormula] rangeOfCharacterFromSet:allowed];

			@try {
				
				// If the string is clean
				if (range.location == NSNotFound) {

					NSString *customViewFormula = [[self getViewCountFormula] stringByReplacingOccurrencesOfString:@"i" withString:[NSString stringWithFormat:@"%llu", originalViewCount]];

					NSExpression *expression = [NSExpression expressionWithFormat:customViewFormula];
					NSNumber *result = [expression expressionValueWithObject:nil context:nil];

					originalViewCount = [result unsignedLongLongValue];


				}

			} @catch (NSException *exception) {
				originalViewCount = %orig;
			}


		}

		return originalViewCount;
	}

	- (long long) screenshotCount {

		long long originalScreenshotCount = %orig;

		if (enabled && enableCustomScreenshots && [self getScreenshotCountFormula]) {
			
			NSCharacterSet *allowed =  [[NSCharacterSet characterSetWithCharactersInString:@"i+/.-*1234567890"] invertedSet];
			NSRange range = [[self getScreenshotCountFormula] rangeOfCharacterFromSet:allowed];

			@try {
				
				if (range.location == NSNotFound) {

					NSString *customScreenshotFormula = [[self getScreenshotCountFormula] stringByReplacingOccurrencesOfString:@"i" withString:[NSString stringWithFormat:@"%llu", originalScreenshotCount]];

					NSExpression *expression = [NSExpression expressionWithFormat:customScreenshotFormula];
					NSNumber *result = [expression expressionValueWithObject:nil context:nil];

					originalScreenshotCount = [result longLongValue];


				}

			} @catch (NSException *exception) {
				originalScreenshotCount = %orig;
			}

		}
		return originalScreenshotCount;
	}


	%end

	%ctor {
		NSLog(@"SHIT");
		    HBLogDebug(@"Hello Test HBLogDebug");
		reloadSettings();
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadSettings, CFSTR("com.rishabswift.snapsspooferprefs/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	}

