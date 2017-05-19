//
//  ReportObj.h
//  TideNews
//
//  Created by 王文辉 on 14-4-26.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReportObj : NSObject

@property (nonatomic) NSInteger reportId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;

- (id) initWithData:(NSDictionary *)data;

@end
