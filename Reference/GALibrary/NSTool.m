//
//  NSTool.m
//  GALibrary
//
//  Created by SuiFeng
//  Copyright 2011 SuiFeng. All rights reserved.
//

#import "NSTool.h"

static NSArray *weekArray = nil;

@implementation NSTool

+ (void) initialize
{
    weekArray = [[NSArray alloc] initWithObjects:@"星期日",@"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六",nil];
}

#pragma mark -
#pragma mark 操作文件的基本函数
+ (NSString *)ReturnDocumentPath:(NSString *)filename {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDir = [paths objectAtIndex:0];
	return [docDir stringByAppendingPathComponent:filename];
}

+ (NSString *)ReturnTmpPath:(NSString *)filename {
	NSString *tempPath = NSTemporaryDirectory();
	return [tempPath stringByAppendingPathComponent:filename];
}

+ (NSString *)ReturnBundlePath:(NSString *)filename {
	return [[NSBundle mainBundle] pathForResource:filename ofType:nil];
}

+ (NSString *)ReturnCachePath:(NSString *)filename {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *docDir = [paths objectAtIndex:0];
	return [docDir stringByAppendingPathComponent:filename];
}

+ (BOOL)FileExistsAtPath:(NSString *)path {
	if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		return YES;
	}
	return NO;
}

+ (void)CreateFolderForPath:(NSString *)path {
	BOOL IsD = YES;
	//当文件夹不存在的时候再创建	
	if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&IsD]) {
		[[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES
												   attributes:nil error:nil];
	}
}
+ (void)DeleteFolderForPath:(NSString *)path {
	BOOL IsD = YES;
	if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&IsD]) {
		[[NSFileManager defaultManager] removeItemAtPath:path error:nil];
	}
}

+ (unsigned long long) FolderSize:(NSString *)path {
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    NSString *fileName;
    unsigned long long int fileSize = 0;
    
    NSFileManager *manager = [NSFileManager defaultManager];
    while (fileName = [filesEnumerator nextObject]) {
        NSDictionary *fileDictionary = [manager attributesOfItemAtPath:[path stringByAppendingPathComponent:fileName] error:nil];
        fileSize += [[fileDictionary objectForKey:NSFileSize] unsignedLongLongValue];
    }
    
    return fileSize;
}

+ (BOOL) RemoveFilesOfPath:(NSString *)path
{
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    
    NSString *fileName;
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    while (fileName = [filesEnumerator nextObject]) {
        [manager removeItemAtPath:[path stringByAppendingPathComponent:fileName] error:&error];
    }
    
    return (error == nil ? YES : NO);
}

#pragma mark -
#pragma mark StaticFunctions
+ (NSTimeInterval) getUNIXTime:(NSString *)input
{
    struct tm created;
    if ([input length] > 0) {
        strptime([input UTF8String], "%Y-%m-%d %H:%M:%S", &created);
    }
    
    return (NSTimeInterval)mktime(&created)+3600;
}

+ (NSString *) getTime:(NSString *)input
{
    struct tm created;
    
    if (input) {
        strptime([input UTF8String], "%Y-%m-%d %H:%M:%S", &created);
        return [NSString stringWithFormat:@"%04d-%02d-%02d %02d:%02d", created.tm_year+1900, created.tm_mon+1, created.tm_mday, created.tm_hour, created.tm_min];
    }
    
    return nil;
}

+ (NSString *) weekText:(NSDate *)date
{
    NSInteger weekDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:date];
    return [weekArray objectAtIndex:weekDay-1];
}

+ (unsigned long long) FileSize:(NSString *)path
{
    NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    return [[fileDictionary objectForKey:NSFileSize] unsignedLongLongValue];
}

@end
