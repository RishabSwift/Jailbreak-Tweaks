#include <substrate.h>

typedef void* CDUnknownBlockType;

@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(BOOL)arg1;
@end

@interface FBSSystemService : NSObject  {
}

+ (id)sharedService;

- (void)reboot;
- (void)sendActions:(id)arg1 withResult:(id)arg2;
- (id)clientCallbackQueue;
- (void)terminateApplicationGroup:(long long)arg1 forReason:(long long)arg2 andReport:(bool)arg3 withDescription:(id)arg4;
- (void)terminateApplication:(id)arg1 forReason:(long long)arg2 andReport:(bool)arg3 withDescription:(id)arg4;
- (void)openDataActivationURL:(id)arg1 withResult:(id)arg2;
- (void)fireCompletion:(id)arg1 error:(id)arg2;
- (id)_badArgumentError;
- (void)shutdown;
- (void)setBadgeValue:(id)arg1 forBundleID:(id)arg2;
- (bool)canOpenApplication:(id)arg1 reason:(long long*)arg2;
- (int)pidForApplication:(id)arg1;
- (void)openApplication:(id)arg1 options:(id)arg2 withResult:(id)arg3;
- (id)init;
- (void)dealloc;
- (void)openApplication:(id)arg1 options:(id)arg2 clientPort:(unsigned int)arg3 withResult:(id)arg4;
- (unsigned int)createClientPort;
- (void)cleanupClientPort:(unsigned int)arg1;
- (void)openURL:(id)arg1 application:(id)arg2 options:(id)arg3 clientPort:(unsigned int)arg4 withResult:(id)arg5;
- (id)systemApplicationBundleIdentifier;

@end

%hook SBDeckSwitcherViewController



- (_Bool)isDisplayItemOfContainerRemovable:(id)arg1 {

    return TRUE;//check

}

- (void)removeDisplayItem:(SBDisplayItem *)arg1 updateScrollPosition:(_Bool)arg2 forReason:(long long)arg3 completion:(CDUnknownBlockType)arg4 {
    if ([arg1.displayIdentifier isEqualToString:@"com.apple.springboard"]) {
        respring();
    }
    else {
        %orig;
    }
}

%end

void respring() {
	// ss
    SBSRestartRenderServerAction *restartAction = [%c(SBSRestartRenderServerAction) restartActionWithTargetRelaunchURL:nil];
   [[%c(FBSSystemService) sharedService] sendActions:[NSSet setWithObject:restartAction] withResult:nil];
}