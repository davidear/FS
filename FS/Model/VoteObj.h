//
//  VoteObj.h
//  TideNews
//
//  Created by 王文辉 on 14-4-26.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoteItem : NSObject

@property (nonatomic) NSInteger voteItemId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic) BOOL selected;
@property (nonatomic) int percent;
@property (nonatomic) int count;

@end

////////////////////////////////////////////////////////////////////////////////

@interface VoteObj : NSObject

@property (nonatomic) NSInteger voteId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *date;
@property (nonatomic) BOOL multiple;
@property (nonatomic) NSInteger total;
@property (nonatomic) NSInteger state;
@property (nonatomic, strong) NSArray  *items;

- (id) initWithData:(NSDictionary *)data;

- (void) saveVote;
- (BOOL) isVoted;

@end
