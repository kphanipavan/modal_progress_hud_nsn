#import "ModalProgressHudNsnPlugin.h"
#if __has_include(<modal_progress_hud_nsn/modal_progress_hud_nsn-Swift.h>)
#import <modal_progress_hud_nsn/modal_progress_hud_nsn-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "modal_progress_hud_nsn-Swift.h"
#endif

@implementation ModalProgressHudNsnPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftModalProgressHudNsnPlugin registerWithRegistrar:registrar];
}
@end
