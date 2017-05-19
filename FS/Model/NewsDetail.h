//
//  NewsDetail.h
//  TideNews
//
//  Created by 王文辉 on 14-4-23.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "NewsObj.h"

@interface NewsDetail : NewsObj

@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *shareUrl;

@end
