#line 1 "Tweak.xm"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIStatusBarTimeItemView; 
static void (*_logos_orig$_ungrouped$UIStatusBarTimeItemView$setVisible$frame$duration$)(_LOGOS_SELF_TYPE_NORMAL UIStatusBarTimeItemView* _LOGOS_SELF_CONST, SEL, BOOL, struct CGRect { struct CGPoint { float x_1_1_1; float x_1_1_2; } x1; struct CGSize { float x_2_1_1; float x_2_1_2; } x2; }, double); static void _logos_method$_ungrouped$UIStatusBarTimeItemView$setVisible$frame$duration$(_LOGOS_SELF_TYPE_NORMAL UIStatusBarTimeItemView* _LOGOS_SELF_CONST, SEL, BOOL, struct CGRect { struct CGPoint { float x_1_1_1; float x_1_1_2; } x1; struct CGSize { float x_2_1_1; float x_2_1_2; } x2; }, double); 

#line 1 "Tweak.xm"

	static void _logos_method$_ungrouped$UIStatusBarTimeItemView$setVisible$frame$duration$(_LOGOS_SELF_TYPE_NORMAL UIStatusBarTimeItemView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1, struct CGRect { struct CGPoint { float x_1_1_1; float x_1_1_2; } x1; struct CGSize { float x_2_1_1; float x_2_1_2; } x2; } arg2, double arg3) {
		x2 = 183;
		x_1_1_2 = 21.5;
		x_2_1_1 = 50;
		x_2_1_2 - 21;
		_logos_orig$_ungrouped$UIStatusBarTimeItemView$setVisible$frame$duration$(self, _cmd, arg1, arg2, arg3);
	}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIStatusBarTimeItemView = objc_getClass("UIStatusBarTimeItemView"); if (_logos_class$_ungrouped$UIStatusBarTimeItemView) {MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarTimeItemView, @selector(setVisible:frame:duration:), (IMP)&_logos_method$_ungrouped$UIStatusBarTimeItemView$setVisible$frame$duration$, (IMP*)&_logos_orig$_ungrouped$UIStatusBarTimeItemView$setVisible$frame$duration$);} else {HBLogError(@"logos: nil class %s", "UIStatusBarTimeItemView");}} }
#line 10 "Tweak.xm"
