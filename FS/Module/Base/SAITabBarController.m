//
//  SAITabBarController.m
//  sai-iOS
//
//  Created by DaiFengyi on 15/9/23.
//  Copyright © 2015年 Malong Tech. All rights reserved.
//

//#import "SAIAuthentication.h"
#import "SAIConstant.h"
//#import "SAILoginComponent.h"
#import "SAITabBarController.h"
#import "SAIUtil.h"
#import <AVFoundation/AVFoundation.h>

@interface SAITabBarController () <UITabBarControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic) SAIFeatures currentFeatur;
@end

@implementation SAITabBarController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UITabBar appearance].backgroundImage = [UIImage imageNamed:@"tabbar_background"];
    [UITabBar appearance].shadowImage = [[UIImage alloc] init];

    //    self.tabBar.translucent = NO;
    self.delegate = self;
    [self initChildVCs];
    self.tabBar.tintColor = [UIColor blackColor];
    [self addNotificationCenterObservers];

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"feedback"] style:UIBarButtonItemStylePlain target:self action:@selector(feedback:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    // badge
    [self onBadgeNumberChanged:nil];
}

- (void)dealloc {
    [self removeNotificationCenterObservers];
}
#pragma mark - Initial Setup
- (void)initChildVCs {
//    SAIDiscoveryController *nnc = [[SAIDiscoveryController alloc] init];
//    nnc.tabBarItem.tag = 0;
//    nnc.tabBarItem.title = @"发现";
//    nnc.tabBarItem.image = [UIImage imageNamed:@"discovery_normal"];
//    nnc.tabBarItem.selectedImage = [[UIImage imageNamed:@"discovery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    ;
//    SAINewSearchController *sc = [[SAINewSearchController alloc] init];
//    sc.tabBarItem.tag = 1;
//    sc.tabBarItem.title = @"搜索";
//    sc.tabBarItem.image = [UIImage imageNamed:@"search_normal"];
//    sc.tabBarItem.selectedImage = [[UIImage imageNamed:@"search_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    ;
//    SAIMeController *mc = [[SAIMeController alloc] init];
//    mc.tabBarItem.tag = 2;
//    mc.tabBarItem.title = @"我";
//    mc.tabBarItem.image = [UIImage imageNamed:@"me_normal"];
//    mc.tabBarItem.selectedImage = [[UIImage imageNamed:@"me_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    ;
//    [self setViewControllers:@[ nnc, sc, mc ]];
//    self.selectedIndex = 1;
}

- (void)addNotificationCenterObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBadgeNumberChanged:) name:STATUS_BADGENUMBER_CHANGED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tackPhotoHandlerByCamara:) name:ACTION_AROUSE_CAMARA object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tackPhotoHandlerByPhotoLibrary:) name:ACTION_AROUSE_PHOTOLIBRARY object:nil];
}

- (void)removeNotificationCenterObservers {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"selectedIndex"];
}

//#pragma mark - RefreshUI
//- (void)refreshUIWithIndex:(NSInteger)index {
//    UIViewController *vc = self.viewControllers[1];
//    switch (index) {
//        case 0:
//            self.viewControllers[index].tabBarItem.title = @"发现";
//            vc.tabBarItem.title = @"搜索";
//            break;
//        case 1:
//            self.viewControllers[index].tabBarItem.title = @"搜索";
//            break;
//        case 2:
//            self.viewControllers[index].tabBarItem.title = @"我";
//            vc.tabBarItem.title = @"搜索";
//            break;
//        default:
//            break;
//    }
//}
#pragma mark - TabBarController
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //    if (tabBarController.selectedViewController == viewController) { // 重复点击已选item
    //        if (tabBarController.selectedIndex == 1) {                   // search
    //            // need to do some
    //            [SAIPopMenu showSuccess:nil];
    //        }
    //        return NO;
    //    }
    
    
//    if (tabBarController.selectedViewController != viewController && [tabBarController.viewControllers indexOfObject:viewController] == 0) {
//        [SAIMonitor trackEvent:monitor_event_Discovery_Open];
//    }
//
//    if ([tabBarController.viewControllers indexOfObject:viewController] == 2) {
//        if (![SAIAuthentication currentUser]) {
//            [[SAILoginComponent sharedSAILoginComponent] showLoginView:^{
//                ((SAIMeController *) viewController).needsRefresh = YES;
//                tabBarController.selectedIndex = 2;
//            }
//                failure:^(NSError *error) {
//                    if (![error.domain isEqualToString:@"canceled"]) {
//                        [SAIMonitor trackError:monitor_eventLabel_error_login error:error];
//                    }
//                }];
//            return NO;
//        }
//        SAIMeController *mc = (SAIMeController *) viewController;
//        mc.needsRefresh = YES;
//    }

    return YES;
}


#pragma mark - Button Action
- (void)feedback:(UIBarButtonItem *)sender {

}

- (void)tackPhotoHandler:(BOOL)isTryCamera feature:(SAIFeatures)feature {
//    UIImagePickerController *imagePicker = nil;
//    if (isTryCamera) {
//        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//            imagePicker = [[UIImagePickerController alloc] init];
//            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//            imagePicker.showsCameraControls = NO;
//            SAICameraOverlayView *cameraOverlayView = [[[NSBundle mainBundle] loadNibNamed:@"SAICameraOverlayView" owner:self options:nil] lastObject];
//            // d!! can not set constraints,due to no super view
//            cameraOverlayView.frame = [UIScreen mainScreen].bounds;
//            cameraOverlayView.imagePickerController = imagePicker;
//            cameraOverlayView.feature = feature;
//            imagePicker.cameraOverlayView = cameraOverlayView;
//        } else {
//            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
//                imagePicker = [[UIImagePickerController alloc] init];
//                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            } else {
//                [SAIUtil showMsg:@"您的设备不支持该功能"];
//            }
//        }
//    } else {
//        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
//            imagePicker = [[UIImagePickerController alloc] init];
//            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        } else {
//            [SAIUtil showMsg:@"您的设备不支持该功能"];
//        }
//    }
//    if (imagePicker == nil) {
//        return;
//    }
//    _currentFeatur = feature;
//    imagePicker.delegate = self;
//    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)tackPhotoHandlerByCamara:(NSNotification *)notification {
    if ([self judgeAvailable:AVMediaTypeVideo]) {
        SAIFeatures features = (SAIFeatures)[notification.object integerValue];
        [self tackPhotoHandler:YES feature:features];
    }
}
- (void)tackPhotoHandlerByPhotoLibrary:(NSNotification *)notification {
    SAIFeatures features = (SAIFeatures)[notification.object integerValue];
    [self tackPhotoHandler:NO feature:features];
}
#pragma mark helper
- (BOOL)judgeAvailable:(NSString *)mediaType {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if (authStatus == AVAuthorizationStatusRestricted) {
        [SAIUtil showMsg:@"您的设备无法使用"];
        return NO;
    } else if (authStatus == AVAuthorizationStatusDenied) {
        [SAIUtil showMsg:@"请在设置-隐私-相机中允许对小AI的授权"];
        return NO;
    } else if (authStatus == AVAuthorizationStatusAuthorized) {
        // NSLog(@"Authorized");
        return YES;
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        return YES;
    }
    return NO;
}
#pragma mark - On Notification
- (void)onBadgeNumberChanged:(NSNotification *)aNotification {
    NSInteger badgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber;
    UITabBarItem *item = self.tabBar.items[2];
    if (badgeNumber == 0) {
        item.badgeValue = nil;
    } else {
        item.badgeValue = [NSString stringWithFormat:@"%ld", (long) badgeNumber];
    }
}
#pragma mark - UIImagePickerControllerDelegate
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    // 1. get image
//    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
//    if (!image) {
//        image = [info objectForKey:UIImagePickerControllerOriginalImage];
//        if (!image) {
//            [SAIUtil showAlert:@"小AI忽然走神了，换个姿势再试一下吧。" title:@"读取图片失败"];
//            return;
//        }
//    }
//    __weak typeof(self) weakSelf = self;
//    [self dismissViewControllerAnimated:NO
//                             completion:^{
//                             }];
//    [SAISmartPreview searchNewImage:image feature:weakSelf.currentFeatur];
//}
@end
