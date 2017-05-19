//
//  GAMarginLabel.m
//  TuJia
//
//  Created by 王文辉 on 13-2-4.
//  Copyright (c) 2013年 途家. All rights reserved.
//

#import "GAMarginLabel.h"

@implementation GAMarginLabel

- (void)drawTextInRect:(CGRect)rect
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.margin)];
}

@end
