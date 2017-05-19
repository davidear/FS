//
//  SearchObj.m
//  TideNews
//
//  Created by 王文辉 on 14-4-26.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "SearchObj.h"

@implementation SearchObj

- (id) initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.newsId = [[data objectForKey:@"id"] integerValue];
        self.title = [data objectForKey:@"title"];
        self.date = [data objectForKey:@"time"];
        self.type = [[data objectForKey:@"type"] intValue];
    }
    return self;
}

@end
