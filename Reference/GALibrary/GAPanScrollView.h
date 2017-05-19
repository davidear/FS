//
//  GAPanScrollView.h
//  TideNews
//
//  Created by 王文辉 on 14-5-14.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GAPanScrollView : UIScrollView

@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;

@end
