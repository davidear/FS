//
//  SAITextView.h
//  sai-iOS
//
//  Created by DaiFengyi on 16/2/15.
//  Copyright © 2016年 Malong Tech. All rights reserved.
//
//  具有placeholder

#import <UIKit/UIKit.h>

@interface SAITextView : UITextView
@property (strong, nonatomic) NSString *placeholder;
@property (strong, nonatomic) UIColor *placeholderColor;
@end
