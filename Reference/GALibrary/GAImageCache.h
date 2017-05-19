//
//  TJImageCache.h
//  TuJia
//
//  Created by 王文辉 on 12-10-17.
//  Copyright (c) 2012年 途家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ClearBlock)(BOOL success);

@interface GAImageCache : NSObject
{
    
}

+ (BOOL) saveImageURL:(NSString *)url withData:(NSData *)data;

//如果已经缓存，则返回对应的数据 反之返回nil
+ (UIImage *) readImageCache:(NSString *)url;

/*
 * 返回图片换成的大小，单位MB
 */
+ (NSString *) cacheSize;

+ (void) clearCache:(ClearBlock)callBack;

@end
