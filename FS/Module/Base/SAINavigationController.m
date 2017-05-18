//
//  SAINavigationController.m
//  sai-iOS
//
//  Created by DaiFengyi on 15/9/23.
//  Copyright © 2015年 Malong Tech. All rights reserved.
//

#import "SAIConstant.h"
//#import "SAIGoodsController.h"
#import "SAINavigationController.h"
@interface SAINavigationController ()

@end

@implementation SAINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_white"] forBarMetrics:UIBarMetricsDefault];
    // if set bgimage and tintCoor, will tigger JD SDK bug, it will hide bgimage when close item page
    // self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.tintColor = [UIColor blackColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushByNotification:) name:ACTION_PUSH_INTO_NAV object:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}
//- (UIViewController *)childViewControllerForStatusBarStyle {
//    if (self.viewControllers) {
//        if ([self.viewControllers.lastObject isKindOfClass:[SAIGoodsController class]]) {
//            return self.viewControllers.lastObject;
//        }
//    }
//    return nil;
//}
- (void)pushByNotification:(NSNotification *)notification {
    if ([notification.object isKindOfClass:[UIViewController class]]) {
        [self pushViewController:notification.object animated:YES];
    }
}
@end
