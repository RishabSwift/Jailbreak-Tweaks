NSString *n = [[NSString alloc] init];

%hook CKConversation
- (id)displayName {
	n = %orig();
	return [n stringByAppendingString:@"omg"];
}
- (id)name {
	n = %orig();
	return [n stringByAppendingString:@"omg"];
}

%end

%hook CKNotificationReplyViewController

- (void)setShouldShowKeyboard:(BOOL)arg1 {
	%orig(false);
}

- (BOOL)shouldShowKeyboard {
	return false;
}
- (BOOL)showsKeyboard {
	return false;
}

%end

%hook CKNotificationChatController
- (BOOL)shouldAllowReplyFromLockScreen {
	return false;
}

- (void)setShouldAllowReplyFromLockScreen:(BOOL)arg1 {
	%orig(false);
}
%end
