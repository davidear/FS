//
//  SAIAPI.m
//  sai-iOS
//
//  Created by Haihan Wang on 15/9/22.
//  Copyright © 2015年 Malong Tech. All rights reserved.
//
#import "AFNetworking.h"
#import "NSString+MD5.h"
#import "FSAPI.h"
#import "SAIUtil.h"
#import "Singleton.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FSAPI ()
typedef NS_ENUM(NSInteger, SAIAPINetMethod) { GET, POST, PATCH, PUT, DELETE };
//@property (nonatomic, strong) NSURL *webappAPI;
@property (nonatomic) double timeoutInterval;
@end

@implementation FSAPI
single_implementation(FSAPI, initPrivate);
- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        // 可以接受的类型
        //        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        // 请求队列的最大并发数
        //    manager.operationQueue.maxConcurrentOperationCount = 5;
        //  请求超时的时间
        manager.requestSerializer.timeoutInterval = 15;
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"text/json",@"text/xml",@"text/plain",@"application/json", nil];
        
        
        //        _timeoutInterval = [[SAIConfigHelper items].apiTimeout doubleValue];
        //        _webappAPI = [NSURL URLWithString:[SAIConfigHelper webappAPI]];
        //        _businessAPI = [NSURL URLWithString:[SAIConfigHelper items].businessAPI];
        //        _searchAPINew = [NSURL URLWithString:[SAIConfigHelper items].searchAPINew];
        //        _passportAPI = [NSURL URLWithString:[SAIConfigHelper items].passportAPI];
    }
    return self;
}
// config will be refresh when app start. so we needn't get the url every time
//- (NSURL *)webappAPI {
//    return [NSURL URLWithString:[SAIConfigHelper webappAPI]];
//}


#pragma mark - network


#pragma mark - Search

+ (NSError *)TestErrorOfSearch:(id)responseObject {
    NSError *error = nil;
    if (responseObject == nil) {
        error = [[NSError alloc] initWithDomain:@"empty response" code:0 userInfo:nil];
    } else if ([responseObject[@"is_err"] boolValue]) {
        error = [[NSError alloc] initWithDomain:@"is_err field is true" code:0 userInfo:responseObject];
    }
    return error;
}

@end
