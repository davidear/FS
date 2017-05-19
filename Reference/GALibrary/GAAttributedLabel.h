//
//  GAAttributedLabel.h
//  TuJia
//
//  Created by 王文辉 on 12-10-25.
//  Copyright (c) 2012年 途家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSAttributedString+GAExtention.h"

typedef enum {
    GAVerticalAlignmentTop = 0,
    GAVerticalAlignmentMiddle,
    GAVerticalAlignmentBottom,
} GAVerticalAlignment;

@interface GAAttributedLabel : UILabel
{
    CTFrameRef textFrame;
    NSAttributedString *attributedText;
    GAVerticalAlignment verticalAlignment;
}

@property (nonatomic, copy) NSAttributedString *attributedText;
@property (nonatomic) GAVerticalAlignment verticalAlignment;
@property (nonatomic) UIEdgeInsets margin;

@end
