//
//  PicItem.m
//  TideNews
//
//  Created by 王文辉 on 14-4-24.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "PicItem.h"

@implementation PicItem

- (id) initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.title = [data objectForKey:@"title"];
        self.imageUrl = [data objectForKey:@"image_url"];
        NSString *intro = [data objectForKey:@"intro"];
        if ([intro isKindOfClass:[NSString class]]) {
            self.intro = intro;
        }
        
    }
    return self;
}

@end
