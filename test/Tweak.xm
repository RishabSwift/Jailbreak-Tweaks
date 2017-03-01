#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>

%hook MainChromeViewController

- (_Bool)prefersStatusBarHidden {	// Hides status bar
	return 1;
}

%end 