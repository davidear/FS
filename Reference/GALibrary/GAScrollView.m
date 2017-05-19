//
//  GAScrollView.m
//  TuJia
//
//  Created by 王文辉 on 12-11-19.
//  Copyright (c) 2012年 途家. All rights reserved.
//

#import "GAScrollView.h"

@implementation GAScrollView

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.superview touchesBegan:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.superview touchesEnded:touches withEvent:event];
}

@end
