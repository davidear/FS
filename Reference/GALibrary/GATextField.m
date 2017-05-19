//
//  GATextField.m
//  GALibrary
//
//  Created by 王文辉 on 13-05-06.
//  Copyright (c) 2012年 Green Apple. All rights reserved.
//

#import "GATextField.h"

@implementation GATextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, self.margin);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, self.margin);
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
    if (self.placeHolderColor) {
        [self.placeHolderColor setFill];
        if (kVersion7) {
            [self.placeholder drawInRect:rect withAttributes:nil];
        } else {
            [self.placeholder drawInRect:rect withFont:self.font];
        }
        
        return;
    }
    [super drawPlaceholderInRect:rect];
}

@end
