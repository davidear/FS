//
//  ProgramObj.m
//  TideNews
//
//  Created by 王文辉 on 14-4-24.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "ProgramObj.h"

@implementation ProgramObj

- (id) initWithData:(NSDictionary *)data
{
    self = [super initWithData:data];
    if (self) {
        NSString *intro = [data objectForKey:@"intro"];
        if ([intro isKindOfClass:[NSString class]]) {
            self.intro = intro;
        }
        
        self.haveSingle = [[data objectForKey:@"hassingle"] boolValue];
    }
    return self;
}

@end
