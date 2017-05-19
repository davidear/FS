//
//  SearchObj.h
//  TideNews
//
//  Created by 王文辉 on 14-4-26.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SearchResultNews=1,
    SearchResultPhoto=2,
    SearchResultZD=3,
    SearchResultCT=4,
    SearchResultReport=5,
} SearchResultType;

@interface SearchObj : NSObject

@property (nonatomic) NSInteger newsId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;
@property (nonatomic) SearchResultType type;

- (id) initWithData:(NSDictionary *)data;

@end
