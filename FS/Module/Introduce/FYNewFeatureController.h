//
//  JSBSNewFeatureController.h
//
//
//  Created by dai.fengyi on 15/4/22.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYNewFeatureController : UIViewController
+ (void)showNewFeatureBeforeRootViewController:(UIWindow *)window callback:(void (^)(void))callback;
@end
