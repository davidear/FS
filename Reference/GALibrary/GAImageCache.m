//
//  TJImageCache.m
//  TuJia
//
//  Created by 王文辉 on 12-10-17.
//  Copyright (c) 2012年 途家. All rights reserved.
//

#import "GAImageCache.h"
#import "NSTool.h"

#define kMaxImageCacheCount (100)
#define kImageCacheFolder   @"ImageCache"
#define kExpiredTime        (-604800.f)

static NSString *kImageCachePath = nil;

@implementation GAImageCache

+ (void) initialize
{
    kImageCachePath = [[NSString alloc] initWithString:[NSTool ReturnCachePath:kImageCacheFolder]];
    [NSTool CreateFolderForPath:kImageCachePath];

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^ {
        NSFileManager *defaultManager = [NSFileManager defaultManager];
        NSArray *array = [defaultManager contentsOfDirectoryAtPath:kImageCachePath error:nil];
        if ([array count] > kMaxImageCacheCount) {
            for (NSString *obj in array) {
                NSString *path = [NSString stringWithFormat:@"%@/%@",kImageCachePath, obj];
                NSDictionary *dict = [defaultManager attributesOfItemAtPath:path error:nil];
                //NSLog(@"%@", [dict objectForKey:NSFileCreationDate]);
                
                NSDate *date = [dict objectForKey:NSFileCreationDate];
                if ([date timeIntervalSinceNow] < kExpiredTime) {
                    [defaultManager removeItemAtPath:path error:nil];
                }
            }
        }
        
//        dispatch_async(dispatch_get_main_queue(), ^ {
//            
//        });
    });
}

+ (BOOL) saveImageURL:(NSString *)url withData:(NSData *)data
{
    return [data writeToFile:[NSString stringWithFormat:@"%@/%@",kImageCachePath, [url lastPathComponent]] atomically:YES];
}

+ (UIImage *) readImageCache:(NSString *)url
{
    NSString *fileName = [url lastPathComponent];
    if ([fileName length] == 0) {
        return nil;
    }
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",kImageCachePath,fileName];
    
    if ([NSTool FileExistsAtPath:filePath]) {
        return [UIImage imageWithContentsOfFile:filePath];
    }
    return nil;
}

+ (NSString *) cacheSize
{
    unsigned long long size = [NSTool FolderSize:kImageCachePath];
    return [NSString stringWithFormat:@"%0.2f MB", size/1048576.f];
}

+ (void) clearCache:(ClearBlock)callBack
{
    dispatch_async(dispatch_get_main_queue(), ^ {
         callBack([NSTool RemoveFilesOfPath:kImageCachePath]);
    });
}

@end
