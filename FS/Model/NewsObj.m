//
//  NewsObj.m
//  TideNews
//
//  Created by 王文辉 on 14-4-13.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "NewsObj.h"
//#import "NSString+GAExtension.h"

@implementation NewsObj

- (id) initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.newsId = [[data objectForKey:@"id"] integerValue];
        self.title = [data objectForKey:@"title"];
        
        self.time = data[@"time"];
        
        //
        self.isVideo = [[data objectForKey:@"is_video"] boolValue];
        
        //
        NSString *imageUrl = [data objectForKey:@"image_url"];
        if ([imageUrl isKindOfClass:[NSString class]] && imageUrl.length > 0) {
            self.imageUrl = imageUrl;
        }
        
        NSString *videoUrl = [data objectForKey:@"video_url"];
        if ([videoUrl isKindOfClass:[NSString class]] && videoUrl.length > 0) {
            self.videoUrl = videoUrl;
            //todo need to replace the code
//            if ([videoUrl isNumeric]) {
//                self.videoType = YES;
//            }
        }
        
        NSString* newType = data[@"newstype"];
        if ([newType isEqualToString:@"picture"]) {
            self.isPictureGallery = YES;
        }
        
        if ([newType isEqualToString:@"vote"]) {
            self.isVote = YES;
            self.voteId = [data[@"voteId"] integerValue];//TODO
        }
        
        //self.describe = [data objectForKey:@""];
    }
    return self;
}

@end
