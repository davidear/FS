//
//  SAIHelper.h
//  sai-iOS
//
//  Created by DaiFengyi on 15/9/22.
//  Copyright © 2015年 Malong Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SAIUtil : NSObject
#pragma mark - HUD
// 显示提示信息
+ (void)showMsg:(NSString *)message;

// 显示加载中...
+ (void)showLoading;

+ (void)showLoading:(NSString *)message;

// 隐藏所有指示器
+ (void)hideHUD;

+ (BOOL)isLoadingShowing;
+ (void)showAlert:(NSString *)message title:(NSString *)title;

#pragma mark - Validation
//检测手机号码是否合法
+ (BOOL)validateMobile:(NSString *)mobileNum;
//检测邮箱格式
+ (BOOL)validateEmail:(NSString *)email;

#pragma mark - Date
+ (NSString *)stringWithDate:(NSDate *)date;
#pragma mark -
+ (UIImage *)compressImageMaxEdgeToMaxLen:(UIImage *)originalImg maxEdgeMaxLen:(int)maxEdgeMaxLen;
+ (UIImage *)cropImage:(UIImage *)originalImg WithFrame:(CGRect)frame;
/**
 *  get current device id, app uninstall and install again will not change
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDeviceID;

/**
 *  test is current debug version and add debug tag if it is
 *
 *  @param orgInfo title of page
 *
 *  @return NSString
 */
+ (NSString *)addDebugTitle:(NSString *)orgInfo;

/**
 *  find a view's controller
 *
 *  @param sourceView sourceView
 *
 *  @return NSString
 */
+ (UIViewController *)findViewController:(UIView *)sourceView;
/**
 *    get the image url with imageMogr2 query string of Qiniu
 *
 *  @param orgURL
 *  @param targetW
 *
 *  @return
 */
+ (NSString *)getQNSizedImageURL:(NSString *)orgURL targetW:(float)targetW;
/**
 *  get the image url with imageMogr2 query string of Qiniu
 *
 *  @param orgURL
 *  @param targetW
 *  @param targetH
 *
 *  @return
 */
+ (NSString *)getQNSizedImageURL:(NSString *)orgURL targetW:(float)targetW targetH:(float)targetH;
/**
 *   get the image url with imageMogr2 query string of Qiniu, and use the provided fouce as crop center
 *
 *  @param orgURL
 *  @param targetW
 *  @param targetH
 *  @param width   org width
 *  @param height  org height
 *  @param focuseX org focuse x
 *  @param focuseY org focuse y
 *
 *  @return
 */
+ (NSString *)getQNSizedImageURL:(NSString *)orgURL
                         targetW:(float)targetW
                         targetH:(float)targetH
                           width:(NSNumber *)width
                          height:(NSNumber *)height
                         focuseX:(NSNumber *)focuseX
                         focuseY:(NSNumber *)focuseY;

+ (UINavigationController *)getRootNav;
@end
