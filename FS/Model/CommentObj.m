//
//  CommentObj.m
//  TideNews
//
//  Created by 王文辉 on 14-4-29.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "CommentObj.h"

@implementation CommentObj

- (id) initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        NSString *username = [data objectForKey:@"username"];
        if ([username isKindOfClass:[NSString class]]) {
            self.username = username;
        } else {
            self.username = @"匿名";
        }
        
        self.time = [data objectForKey:@"time"];
        self.content = [data objectForKey:@"content"];
        self.rowHeight = [self.content sizeWithFont:kFontSmall constrainedToSize:CGSizeMake(kCommentWidth, MAXFLOAT)].height;
    }
    return self;
}

@end
