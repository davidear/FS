//
//  GAImageLoader.h
//  artlem
//
//  Created by 王文辉 on 12-10-28.
//  Copyright (c) 2012年 Green Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GAImageLoaderManagerDelegate.h"

@interface GAImageLoader : NSObject
{
    id<GAImageLoaderDelegate> __unsafe_unretained delegate_;
    NSURLConnection *conn_;
    NSMutableData   *data_;
    
    NSString        *url_;
    
    NSInteger       statusCode_;
}

@property (nonatomic, unsafe_unretained) id<GAImageLoaderDelegate> delegate;
@property (nonatomic, strong) NSString *url;

- (id) initWithURL:(NSString *)url;

- (void) start;
- (void) cancel;

@end
