//
//  PicItem.h
//  TideNews
//
//  Created by 王文辉 on 14-4-24.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *imageUrl;

- (id) initWithData:(NSDictionary *)data;

@end
