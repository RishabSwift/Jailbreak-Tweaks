// NSString *n = [[NSString alloc] init];

%hook UIAlertController

// - (void)setMessage:(id)arg1 {
// 	%orig([NSString stringWithFormat:@"Fucking %@", arg1]);
// }

// - (id)message {
// 	return @"SHIT";
// }

// - (void)setCancelAction:(id)arg1 {
// 	%orig;


// 	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
// 		message:@"This is an alert."
// 		preferredStyle:UIAlertControllerStyleAlert];

// 	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
// 		handler:^(UIAlertAction * action) {}];

// 	[alert addAction:defaultAction];
// 	[self presentViewController:alert animated:YES completion:nil];

// }

// - (void)setTitle:(id)arg1 {
// 	// %orig(@"FUCK BITCHES");
// 	%orig([NSString stringWithFormat:@"Fucking %@", arg1]);
// }

+ (id)alertControllerWithTitle:(id)arg1 message:(id)arg2 preferredStyle:(int)arg3 {
	arg1 = [NSString stringWithFormat:@"Fucking Title %@", arg1];
	arg2 = [NSString stringWithFormat:@"Fucking Message %@", arg1];

	return %orig;
}

%end