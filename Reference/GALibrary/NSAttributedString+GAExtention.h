//
//  NSMutableAttributedString+GAExtention.h
//  TuJia
//
//  Created by 王文辉 on 12-10-25.
//  Copyright (c) 2012年 途家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NSMutableAttributedString (GAExtention)

- (void)setTextColor:(UIColor*)color range:(NSRange)range;
- (void)setTextAlignment:(CTTextAlignment)alignment lineBreakMode:(CTLineBreakMode)lineBreakMode;
-(void)setTextAlignment:(CTTextAlignment)alignment lineBreakMode:(CTLineBreakMode)lineBreakMode range:(NSRange)range;
-(void)setFont:(UIFont *)font range:(NSRange)range;

@end
