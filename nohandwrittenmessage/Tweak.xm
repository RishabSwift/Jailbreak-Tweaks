%hook CKHandwritingPresentationController

- (void)setVisible:(BOOL)arg1 {
	%orig(false);
}


- (BOOL)visible {
	return false;
}

- (BOOL)requestedVisibility {
	return false;
}

- (BOOL)actualVisibility {
	return false;
}
%end