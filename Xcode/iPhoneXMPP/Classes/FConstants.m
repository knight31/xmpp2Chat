//
//  FConstants.m
//  MeetingCloud
//
//  Created by 高 欣 on 11-12-29.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FConstants.h"
#import "Util.h"
 
//NSString *const HttpServerURL = @"http://10.4.251.91:8080/MeetingCloud/";
//NSString *const HttpServerURL = @"http://180.168.123.183:8001/MeetingCloud/";
//NSString *const HttpServerURL = @"http://180.168.123.183:8001/MeetingCloud/";
//NSString *const HttpServerURL = @"http://172.31.20.57:8002/MeetingCloud/";
//NSString *const HttpServerURL = @"http://180.168.123.183:8009/MeetingCloud/api/";
NSString *const HttpServerURL = @"http://180.168.123.183:8010/MeetingCloud/api/";
//NSString *const HttpServerURL = @"http://180.168.123.160:9125/MeetingCloud/api/";

//NSString *const HttpServerURL = @"http://172.31.23.31:8001/MeetingCloud/api/";
//NSString *const HttpServerURL = @"http://10.4.251.84:8080/MeetingCloud/api/";

//NSString *const RecommendURL = @"http://ycx.wuhan.net.cn/v.do?m=down&v=1"; 
NSString *const RecommendURL = @""; 
 
NSString *const LoadingImage =@"page.png"; 

NSString *const DefaultNavigationBackImage = @"bg-nav-bar";

NSString *const MainNavigationBackImage = @"bg-nav-bar";

NSString *const LoginNavigationBackImage = @"bg-nav-barlogin";

int const PageSize=10;
#pragma mark -
#pragma mark UserDefault Key
NSString *const DFKey3GDate     = @"DFKey3GDate";
NSString *const DFKeyStatistics     = @"DFKeyStatistics";
NSString *const DFKeyReloadShareList     = @"DFKeyReloadShareList";
#pragma mark -
#pragma mark Appsettings Key
NSString *const DFKeyServerLoginURL     = @"DFKeyServerLoginURL";
NSString *const DFKeyServerDefaultURL     = @"DFKeyServerDefaultURL";
NSString *const DFKeyServerImageURL     = @"DFKeyServerImageURL";
NSString *const DFKeyImageScaleRate     = @"DFKeyImageScaleRate";

NSString *const DFNotificationGetCheck = @"DFNotificationGetCheck";

NSString *const DFNotificationHideLoading = @"DFNotificationHideLoading";
NSString *const DFNotificationShowLoading = @"DFNotificationShowLoading";
NSString *const DFNotificationChangeLoginState = @"DFNotificationChangeLoginState";
NSString *const DFNotificationChangeCancelState = @"DFNotificationChangeCancelState";
NSString *const DFNotificationFinishQuestion = @"DFNotificationFinishQuestion";
NSString *const DFNotificationPopSubViewController = @"DFNotificationPopSubViewController";

NSString *const DFNotificationSwitchToSharePostViewInShareViewController  = @"DFNotificationSwitchToSharePostViewInShareViewController";
NSString *const DFNotificationSwitchToShareViewInShareViewController  = @"DFNotificationSwitchToShareViewInShareViewController";
NSString *const DFNotificationSwitchTabNarControllerSelectedIndex  = @"DFNotificationSwitchTabNarControllerSelectedIndex";
NSString *const DFNotificationChangeFavouriteRoadConditions  = @"DFNotificationChangeFavouriteRoadConditions";
NSString *const DFNotificationSwitchView  = @"DFNotificationSwitchView";
NSString *const DFNotificationGoRegister  = @"DFNotificationGoRegister";

NSString *const DFNotificationSwitchViewController = @"DFNotificationSwitchViewController";
NSString *const DFNotificationPickerSelect = @"DFNotificationPickerSelect";
NSString *const DFNotificationChangeNavgationTitle = @"DFNotificationChangeNavgationTitle";
NSString *const DFNotificationAddGuestWord = @"DFNotificationAddGuestWord";
NSString *const DFNotificationRefreshNotice = @"DFNotificationRefreshNotice";
@implementation FConstants

+ (id) settingForKey:(NSString *)key {
    static NSDictionary *AppSettings = nil;
    if (!AppSettings) {
        NSString *filePath = [[[self class] resourcePath] stringByAppendingPathComponent:@"app-settings.xml"];
        AppSettings = [[NSDictionary alloc] initWithContentsOfFile:filePath];
#if DEBUG_MODE
       
#endif
    }
    return [AppSettings objectForKey:key];
}

+ (NSString *) stringSettingForKey:(NSString *)key {
    id setting = [self settingForKey:key];
    return [setting isKindOfClass:NSString.class] ?
    (NSString *)setting : [NSString stringWithFormat:@"%@", setting];
}

+ (int) intSettingForKey:(NSString *)key {
    return [[self settingForKey:key] intValue];
}

+ (CGFloat) floatSettingForKey:(NSString *)key {
    return [[self settingForKey:key] floatValue];
}

+ (BOOL) boolSettingForKey:(NSString *)key {
    return [[self settingForKey:key] boolValue];
}
+ (NSString *) cachePath {
    static NSString *cachePath = nil;
    if (!cachePath) {
        cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        cachePath = [cachePath copy];
    }
    return cachePath;
}

+ (NSString *) resourcePath {
    static NSString *resourcePath = nil;
    if (!resourcePath) {
        resourcePath = [[[NSBundle mainBundle] resourcePath] copy];
    }
    return resourcePath;
}
 
@end
