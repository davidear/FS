//
//  GAVerticallyAlignedLabel.h
//  TuJia
//
//  Created by 王文辉 on 13-5-23.
//  Copyright (c) 2013年 途家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum VerticalAlignment {
    VerticalAlignmentTop = 0,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface GAVerticallyAlignedLabel : UILabel

@property (nonatomic) VerticalAlignment verticalAlignment;

@end
