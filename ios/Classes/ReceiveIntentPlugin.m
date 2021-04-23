#import "ReceiveIntentPlugin.h"
#if __has_include(<receive_intent/receive_intent-Swift.h>)
#import <receive_intent/receive_intent-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "receive_intent-Swift.h"
#endif

@implementation ReceiveIntentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftReceiveIntentPlugin registerWithRegistrar:registrar];
}
@end
