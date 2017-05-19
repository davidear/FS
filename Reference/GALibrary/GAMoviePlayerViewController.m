//
//  GAMoviePlayerViewController.m
//  licai
//
//  Created by gao ying on 13-12-5.
//  Copyright (c) 2013年 gao ying. All rights reserved.
//

#import "GAMoviePlayerViewController.h"
#define GAScreenHeight [[UIScreen mainScreen] bounds].size.height

@implementation GAMoviePlayerViewController

-(id)initWithContentURL:(NSURL *)contentURL{
    self = [super initWithContentURL:contentURL];
    if(self){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0.f, 0.f, GAScreenHeight,GAScreenHeight);
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(stopAct) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    return  self;
}

-(void)stopAct
{
    [self.moviePlayer stop];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
@end
