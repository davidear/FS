//
//  FSQuestionController.m
//  FS
//
//  Created by jason on 2017/5/19.
//  Copyright © 2017年 jason. All rights reserved.
//

#import "FSQuestionController.h"
#import "HMSegmentedControl.h"
#import "FSQuestionListController.h"
#import "Masonry.h"
@interface FSQuestionController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@end

@implementation FSQuestionController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

#pragma mark - Initial Setup
- (void)initData {
    [super initData];
    self.pageTitleArray = @[@"One", @"Two", @"Three"];
    self.pageArray = @[[[FSQuestionListController alloc] init],[[FSQuestionListController alloc] init],[[FSQuestionListController alloc] init]];
}

- (void)initSubviews {
    [super initSubviews];
}

- (void)setupSubviews {
    [super setupSubviews];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
