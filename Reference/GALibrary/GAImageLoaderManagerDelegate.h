//
//  GAImageLoaderManagerDelegate.h
//  artlem
//
//  Created by 王文辉 on 12-10-28.
//  Copyright (c) 2012年 Green Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GAImageLoader, GAImageLoaderManager;

@protocol GAImageLoaderDelegate <NSObject>

@required
- (void)imageDownloader:(GAImageLoader *)downloader didFinishWithImage:(NSData *)data;

@optional
- (void)imageDownloader:(GAImageLoader *)downloader didFailWithError:(NSError *)error;

@end


@protocol GAImageLoaderManagerDelegate <NSObject>

@required
- (void)imageManageComplete:(NSString *)url didFinishWithImage:(UIImage *)image;

@optional
- (void)imageManageComplete:(NSString *)url didFailWithError:(NSError *)error;

@end
