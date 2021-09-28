#import "IpwfPlugin.h"
#if __has_include(<ipwf/ipwf-Swift.h>)
#import <ipwf/ipwf-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
//#import "ipwf-Swift.h"
#endif

@implementation IpwfPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIpwfPlugin registerWithRegistrar:registrar];
}
@end
