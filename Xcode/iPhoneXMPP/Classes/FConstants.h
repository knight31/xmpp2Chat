//
//  FConstants.h
//  IDEAL_TYSX
//
//  Created by 高 欣 on 11-12-29.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BarButtonColor         [UIColor colorWithRed:90.0f/255.0f green:189.0f/255.0f blue:175.0f/255.0f alpha:1.0f]
#define kDEFAULT_DATE_TIME_FORMAT (@"yyyyMMddHHmmss")
#define LOADING_DEF  @"正在载入中...."
#define NO_MORE_DEF  @"没有更多"
#define UPLOADING_DEF @"上拉可载入更多"
#define REQUESTERROR NSLocalizedString(@"Network_Error", nil)
#define NOTLOGIN @"登陆用户才能使用！"
#define DEFAULTCOOKIE @"guest"
#define FAILSTRING @"fail"
#define USER_COOKIE   @"userCookie"
#define REG_NUMBER    @"phoneNumber"
#define Separater @"|" 
#define SecondSeparater @"`" 
#define ClientType @"1"
#define DeviceModel [NSString stringWithFormat:@"%@%@",[[UIDevice currentDevice] systemName],[[UIDevice currentDevice] systemVersion]]
#define Version [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define DeviceToken @"devicetoken"

#define TemperatureKey @"temperature"
#define WeatherDescKey @"weatherDesc"
#define WeatherUrlForDayKey @"img0"
#define WeatherUrlForNightKey @"img1"
#define WeekKey @"week"
#define DateKey @"date"
#define WeatherForDayKey @"img0Title"
#define WeatherForNightKey @"img1Title"

#define AppUrlKey @"AppUrl"

 
#define LIGHT_BACKGROUND [UIColor colorWithRed:212.0/255.0 green:212.0/255.0 blue:212.0/255.0 alpha:1.0]
#define DEFAULT_BACKGROUND [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main.png"]] 

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_EN [[[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]  objectAtIndex:0] isEqualToString:@"en"]


#if DEBUG_MODE
#define CLog(log, ...) NSLog((@"%s [Line %d] " log), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define CLog(log, ...)
#endif


extern NSString *const HttpServerURL;
 
extern NSString *const RecommendURL;

extern NSString *const LoadingImage;
extern NSString *const DefaultNavigationBackImage;//默认的NavigationBar背景图
extern NSString *const MainNavigationBackImage;//首页的NavigationBar背景图
extern NSString *const LoginNavigationBackImage;//登陆的NavigationBar背景图

extern int const PageSize;

#pragma mark -
#pragma mark UserDefault Key
extern NSString *const DFKey3GDate;
extern NSString *const DFKeyStatistics;
extern NSString *const DFKeyReloadShareList;


#pragma mark -
#pragma mark Appsettings Key
extern NSString *const DFKeyServerLoginURL;
extern NSString *const DFKeyServerDefaultURL;
extern NSString *const DFKeyServerImageURL;
extern NSString *const DFKeyImageScaleRate;
 

#pragma mark -
#pragma mark NotificationKey 
extern NSString *const DFNotificationHideLoading;
extern NSString *const DFNotificationShowLoading;

extern NSString *const DFNotificationChangeLoginState;
extern NSString *const DFNotificationChangeCancelState;
extern NSString *const DFNotificationFinishQuestion;
extern NSString *const DFNotificationPopSubViewController;

extern NSString *const DFNotificationNavigateToMain;

extern NSString *const DFNotificationGetCheck;

extern NSString *const DFNotificationSwitchViewController;
extern NSString *const DFNotificationPickerSelect; 
extern NSString *const DFNotificationChangeNavgationTitle;
extern NSString *const DFNotificationSwitchToSharePostViewInShareViewController;
extern NSString *const DFNotificationSwitchToShareViewInShareViewController;
extern NSString *const DFNotificationAddGuestWord;
extern NSString *const DFNotificationRefreshNotice;
 

extern NSString *const DFNotificationSwitchTabNarControllerSelectedIndex;
extern NSString *const DFNotificationChangeFavouriteRoadConditions;
extern NSString *const DFNotificationSwitchView;
extern NSString *const DFNotificationGoRegister;
 
 
 
 
 
@interface FConstants : NSObject
+ (id) settingForKey:(NSString *)key;
+ (NSString *) stringSettingForKey:(NSString *)key;
+ (int) intSettingForKey:(NSString *)key;
+ (CGFloat) floatSettingForKey:(NSString *)key;
+ (BOOL) boolSettingForKey:(NSString *)key;
+ (NSString *) cachePath;
+ (NSString *) resourcePath;
@end
