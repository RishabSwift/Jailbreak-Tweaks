@interface IGUser
-(NSString *) username;
@end


@interface IGAuthenticatedUser 
@property(copy) NSString *username; 
@end

id shitInfo = nil;

%hook IGUser

- (void)setVerified:(bool)arg1
{
		// if (self.needy == true) {
		// 	%orig(true);
		// } else {
		// 	%orig();
		// }
	%orig(true);
}
-(void)setUsername:(id)arg1 {

		// %orig([IGAuthenticatedUser username]);
		// %orig(@"fuck you bitch");
	%orig;
}

- (id)messageWithParameter:(id)arg1 mediaUploadManager:(id)arg2 currentUser:(id)arg3 {
	shitInfo = arg3;
	return %orig;
}
// // For the setVerified method!
// if ([self username] == [x username]) {
// 	%orig(true);
// }


%end



%hook IGViewController
- (void)viewDidLoad {
	%orig;
	NSLog(@"SHIT BRO");
	%log("FUCK YOU ");


	 UIAlertController *alertController = [ UIAlertController
                                          alertControllerWithTitle:@"FUCK"
                                          message:shitInfo
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Sorry, my bad..." style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
%end