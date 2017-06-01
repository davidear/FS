//
//  AppDelegate.m
//  FS
//
//  Created by jason on 2017/5/16.
//  Copyright © 2017年 jason. All rights reserved.
//

#import "AppDelegate.h"
//#import "SAILoginComponent.h"
#import "FYNewFeatureController.h"
#import "FSNavigationController.h"
#import "FSTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    UINavigationController *navMain = [[UINavigationController alloc] init];
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [SAILoginComponent sharedSAILoginComponent].mainWindow = self.window;
//    
//    [FYNewFeatureController showNewFeatureBeforeRootViewController:self.window
//                                                          callback:^{
//                                                              SAINavigationController *navMain = [[SAINavigationController alloc]
//                                                                                                  initWithRootViewController:[[SAITabBarController alloc] init]];
//                                                              self.window.rootViewController = navMain;
//                                                              [self.window makeKeyAndVisible];
//                                                              // try popup page
//                                                              dispatch_queue_t serialQueue = dispatch_queue_create("sai.launchPopup", DISPATCH_QUEUE_SERIAL);
//                                                              dispatch_async(serialQueue, ^{
//                                                                  
////                                                                  [SAILaunchPopup popUpNotify:navMain];
//                                                              });
//                                                          }];

    
//    self.window.rootViewController = navMain;
//    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark RemoteNotification
//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    // Required
//    [APService registerDeviceToken:deviceToken];
//}
//
//- (void)application:(UIApplication *)application
//didReceiveRemoteNotification:(NSDictionary *)userInfo
//fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    void(^tapBlock)(void(^completeHandler)()) = ^(void(^completeHandler)()) { //嵌套
//        if (completeHandler) {
//            completeHandler();
//        }
//        NSNumber *type = userInfo[@"sai_type"];
//        if (type.integerValue == 1) {
//            if (userInfo[@"sai_weburl"] != nil) {
//                SAIWebPopController * wpc = [[SAIWebPopController alloc] init];
//                [wpc popupWithLink:userInfo[@"sai_weburl"] type:Present];
//            }
//        }
//    };
//    if (application.applicationState == UIApplicationStateActive) { // 在前台
//        CWStatusBarNotification *sbn = [CWStatusBarNotification new];
//        sbn.notificationStyle = CWNotificationStyleNavigationBarNotification;
//        sbn.notificationLabelBackgroundColor = [UIColor colorWithHexString:@"f8f8f8"];
//        sbn.notificationLabelTextColor = [UIColor blackColor];
//        sbn.notificationAnimationInStyle = CWNotificationAnimationStyleTop;
//        sbn.notificationAnimationOutStyle = CWNotificationAnimationStyleTop;
//        __weak typeof(sbn) weakSbn = sbn;
//        sbn.notificationTappedBlock = ^(void) {
//            tapBlock(^(void) {
//                [weakSbn dismissNotification];
//            });
//        };
//        [sbn displayNotificationWithMessage:(userInfo[@"aps"][@"alert"] ? userInfo[@"aps"][@"alert"] : nil) forDuration:5.0f];
//    }else { // 后台或未启动
//        tapBlock(nil);
//    }
//    NSNumber *badgeNumber = userInfo[@"aps"][@"badge"];
//    [UIApplication sharedApplication].applicationIconBadgeNumber = badgeNumber.integerValue;
//    [APService handleRemoteNotification:userInfo];
//    completionHandler(UIBackgroundFetchResultNewData);
//}
//
//- (void)application:(UIApplication *)application
//handleActionWithIdentifier:(NSString *)identifier
//forRemoteNotification:(NSDictionary *)userInfo
//   withResponseInfo:(NSDictionary *)responseInfo
//  completionHandler:(void (^)())completionHandler {
//}

#pragma mark - On Notifications
//#pragma mark 自定义消息推送
//- (void)networkDidReceiveMessage:(NSNotification *)notification {
//    NSDictionary *userInfo = [notification userInfo];
//    NSString *content = [userInfo valueForKey:@"content"];
//    NSDictionary *extras = [userInfo valueForKey:@"extras"];
//    NSString *customizeField1 = [extras valueForKey:@"customizeField1"]; //自定义参数，key是自己定义的
//}

@end
