//
//  VideoObj.m
//  TideNews
//
//  Created by 王文辉 on 14-4-25.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "VideoObj.h"

@implementation VideoObj

- (id) initWithData:(NSDictionary *)data
{
    self = [super initWithData:data];
    if (self) {
        NSString *intro = [data objectForKey:@"intro"];
        if ([intro isKindOfClass:[NSString class]]) {
            self.intro = intro;
        }
        
        self.isAudio = [[data objectForKey:@"isgb"] boolValue];
        if (self.isAudio) {
            self.audioImageUrl = [data objectForKey:@"gb_photo"];
        }
    }
    return self;
}


@end
