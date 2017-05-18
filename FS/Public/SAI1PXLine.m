//
//  SAI1PXLine.m
//  sai-iOS
//
//  Created by DaiFengyi on 15/12/31.
//  Copyright © 2015年 Malong Tech. All rights reserved.
//

#import "SAI1PXLine.h"

@implementation SAI1PXLine
- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.frame;
    rect.size.height = (1 / [UIScreen mainScreen].scale);
    self.frame = rect;
}

@end
