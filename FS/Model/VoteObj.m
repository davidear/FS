//
//  VoteObj.m
//  TideNews
//
//  Created by 王文辉 on 14-4-26.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "VoteObj.h"
#import "NSTool.h"

@implementation VoteItem

- (id) initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.voteItemId = [[data objectForKey:@"id"] integerValue];
        self.title = [data objectForKey:@"title"];
        self.count = [[data objectForKey:@"number"] integerValue];
    }
    return self;
}


@end

////////////////////////////////////////////////////////////////////////////////

@implementation VoteObj

- (id) initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.voteId = [[data objectForKey:@"id"] integerValue];
        self.title = [data objectForKey:@"title"];
        self.imageUrl = [data objectForKey:@"image_url"];
        self.date = [data objectForKey:@"date"];
        self.multiple = [[data objectForKey:@"is_multiple"] integerValue];
        //self.total = [[data objectForKey:@"total"] integerValue];
        self.state = [[data objectForKey:@"state"] integerValue];
        NSArray *items = [data objectForKey:@"items"];
        NSMutableArray *dataArray = [NSMutableArray array];
        for (NSDictionary *dict in items) {
            VoteItem *item = [[VoteItem alloc] initWithData:dict];
            self.total += item.count;
            [dataArray addObject:item];
        }
        self.items = dataArray;
    }
    return self;
}

#define VoteFile @"vote.plist"

- (void) saveVote
{
    NSString *file = [NSTool ReturnCachePath:VoteFile];
    NSMutableArray *dataArray = [NSMutableArray arrayWithContentsOfFile:file];
    if (dataArray) {
        [dataArray addObject:[NSNumber numberWithInteger:self.voteId]];
    } else {
        dataArray = [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:self.voteId]];
    }
    [dataArray writeToFile:file atomically:YES];
}

- (BOOL) isVoted
{
    NSString *file = [NSTool ReturnCachePath:VoteFile];
    NSMutableArray *dataArray = [NSMutableArray arrayWithContentsOfFile:file];
    if (dataArray && [dataArray indexOfObject:[NSNumber numberWithInteger:self.voteId]] != NSNotFound) {
        return YES;
    }
    return NO;
}

@end
