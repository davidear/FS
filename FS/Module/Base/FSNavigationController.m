//
//  SAINavigationController.m
//  sai-iOS
//
//  Created by DaiFengyi on 15/9/23.
//  Copyright © 2015年 Malong Tech. All rights reserved.
//

#import "SAIConstant.h"
//#import "SAIGoodsController.h"
#import "FSNavigationController.h"
@interface FSNavigationController ()

@end

@implementation FSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_white"] forBarMetrics:UIBarMetricsDefault];
    // if set bgimage and tintCoor, will tigger JD SDK bug, it will hide bgimage when close item page
    // self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.tintColor = [UIColor colorWithRed:164/255.0 green:173/255.0 blue:181/255.0 alpha:1];
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor colorWithRed:250/255.0 green:114/255.0 blue:54/255.0 alpha:1]};

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
