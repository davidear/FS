//
//  UserObj.m
//  TideNews
//
//  Created by 王文辉 on 14-4-27.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "UserObj.h"

static UserObj *user = nil;

#define UserNameKey @"UserName"
#define UserIdKey   @"UserId"

@implementation UserObj

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *username = [defaults objectForKey:UserNameKey];
        NSInteger userid = [defaults integerForKey:UserIdKey];
        if (username && userid > 0) {
            user = [[UserObj alloc] init];
            user.userId = userid;
            user.userName = username;
        }
    });
}

+ (void) parseData:(NSDictionary *)data
{
    if (user == nil) {
        user = [[UserObj alloc] init];
    }
    
    user.userId = [[data objectForKey:@"uid"] integerValue];
    user.userName = [data objectForKey:@"name"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:user.userId forKey:UserIdKey];
    [defaults setObject:user.userName forKey:UserNameKey];
    [defaults synchronize];
}

+ (UserObj *) shareInstance
{
    return user;
}

+ (void) logout
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:UserIdKey];
    [defaults removeObjectForKey:UserNameKey];
    [defaults synchronize];
    user = nil;
}

@end
