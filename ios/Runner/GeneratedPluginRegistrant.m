//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <image_picker/ImagePickerPlugin.h>
<<<<<<< HEAD
#import <shared_preferences/SharedPreferencesPlugin.h>
=======
#else
@import image_picker;
#endif

#if __has_include(<shared_preferences/SharedPreferencesPlugin.h>)
#import <shared_preferences/SharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

#if __has_include(<url_launcher/UrlLauncherPlugin.h>)
>>>>>>> 2d5ff4ddac784c1195e060ae2c8efb0314fe7f6a
#import <url_launcher/UrlLauncherPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
}

@end
