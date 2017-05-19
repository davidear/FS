//
//  UserObj.h
//  TideNews
//
//  Created by 王文辉 on 14-4-27.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserObj : NSObject

@property (nonatomic) NSInteger userId;
@property (nonatomic, strong) NSString *userName;

+ (void) parseData:(NSDictionary *)data;
+ (UserObj *)shareInstance;
+ (void) logout;

@end
