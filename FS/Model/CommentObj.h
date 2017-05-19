//
//  CommentObj.h
//  TideNews
//
//  Created by 王文辉 on 14-4-29.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kCommentWidth 288.f

@interface CommentObj : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *content;
@property (nonatomic) CGFloat rowHeight;

- (id) initWithData:(NSDictionary *)data;

@end
