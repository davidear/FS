//
//  NSTool.h
//  GALibrary
//
//  Created by SuiFeng
//  Copyright 2011 SuiFeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSTool : NSObject {

}

#pragma mark -
#pragma mark 操作文件的基本函数
+ (NSString *)ReturnDocumentPath:(NSString *)filename;
+ (NSString *)ReturnTmpPath:(NSString *)filename;
+ (NSString *)ReturnBundlePath:(NSString *)filename;
+ (NSString *)ReturnCachePath:(NSString *)filename;
+ (BOOL)FileExistsAtPath:(NSString *)path;
+ (unsigned long long) FileSize:(NSString *)path;

+ (void)CreateFolderForPath:(NSString *)path;//path包括要创建的文件夹的名字
+ (void)DeleteFolderForPath:(NSString *)path;
+ (unsigned long long) FolderSize:(NSString *)path;
+ (BOOL) RemoveFilesOfPath:(NSString *)path;

+ (NSTimeInterval) getUNIXTime:(NSString *)input;
+ (NSString *) getTime:(NSString *)input;
+ (NSString *) weekText:(NSDate *)date;

@end
