//
//  VideoObj.h
//  TideNews
//
//  Created by 王文辉 on 14-4-25.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "NewsObj.h"

@interface VideoObj : NewsObj

@property (nonatomic, strong) NSString *intro;
@property (nonatomic) BOOL isAudio;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *audioImageUrl;

@end
