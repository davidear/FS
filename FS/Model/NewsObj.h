//
//  NewsObj.h
//  TideNews
//
//  Created by 王文辉 on 14-4-13.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsObj : NSObject

@property (nonatomic) NSInteger newsId;
@property (strong,nonatomic) NSString* time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrl;
//@property (nonatomic, strong) NSString *describe;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic) BOOL isVideo;
@property (nonatomic) BOOL videoType;//NO-url Yes-videoId
@property (nonatomic) BOOL isPictureGallery;

//TODO
@property (nonatomic) BOOL isVote;
@property (nonatomic) NSInteger voteId;

- (id) initWithData:(NSDictionary *)data;

@end
