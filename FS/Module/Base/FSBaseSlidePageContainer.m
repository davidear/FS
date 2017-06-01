//
//  FSBaseSlidePageContainer.m
//  FS
//
//  Created by jason on 2017/5/22.
//  Copyright © 2017年 jason. All rights reserved.
//
//  基础框架基类，子类有问答、直播、订阅
#import "FSBaseSlidePageContainer.h"
#import "HMSegmentedControl.h"
#import "Masonry.h"
@interface FSBaseSlidePageContainer ()

@end

@implementation FSBaseSlidePageContainer
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initSubviews];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupSubviews];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}
//#pragma mark - Setter and Getter
//- (NSArray *)pageArray {
//    @throw [NSException exceptionWithName:@"override" reason:@"subclass should override this method" userInfo:nil];
//}
//
//- (NSArray *)pageTitleArray {
//    @throw [NSException exceptionWithName:@"override" reason:@"subclass should override this method" userInfo:nil];
//}
#pragma mark - Initial Setup
- (void)initData {
    
}

- (void)initSubviews {
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:self.pageTitleArray];
    segmentedControl.backgroundColor = [UIColor clearColor];
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    segmentedControl.frame = CGRectMake(0, 0, self.pageTitleArray.count * 80, 44);
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl = segmentedControl;
    
    //  pageController
    UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageController.delegate = self;
    pageController.dataSource = self;
    [pageController setViewControllers:@[self.pageArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [pageController didMoveToParentViewController:self];
    
    self.pageController = pageController;
    [self.view addSubview:self.pageController.view];
    
    [pageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.topMargin.equalTo(@64);
        make.bottomMargin.equalTo(@(-49));
    }];
}

- (void)setupSubviews {
}

#pragma mark - SegmentControl
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentControl {
    NSInteger originalInex = [self.pageArray indexOfObject:self.pageController.viewControllers.firstObject];
    UIPageViewControllerNavigationDirection direction = originalInex < segmentControl.selectedSegmentIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse;
    [self.pageController setViewControllers:@[self.pageArray[segmentControl.selectedSegmentIndex]] direction:direction animated:YES completion:^(BOOL finished) {
    }];
}

#pragma mark - UIPageViewController
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.pageArray indexOfObject:viewController];
    NSInteger count = self.pageArray.count;
    [self.segmentedControl setSelectedSegmentIndex:index];
    return index == 0 ? nil : self.pageArray[(index-1+count)%count];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.pageArray indexOfObject:viewController];
    NSInteger count = self.pageArray.count;
    [self.segmentedControl setSelectedSegmentIndex:index];
    return index == count - 1 ? nil : self.pageArray[(index+1+count)%count];
}

@end
