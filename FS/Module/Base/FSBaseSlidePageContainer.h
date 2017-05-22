//
//  FSBaseSlidePageContainer.h
//  FS
//
//  Created by jason on 2017/5/22.
//  Copyright © 2017年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMSegmentedControl;
@interface FSBaseSlidePageContainer : UIViewController<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (strong, nonatomic) HMSegmentedControl *segmentedControl;
@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageArray;
@property (strong, nonatomic) NSArray *pageTitleArray;

- (void)initData;
- (void)initSubviews;
- (void)setupSubviews;
@end
