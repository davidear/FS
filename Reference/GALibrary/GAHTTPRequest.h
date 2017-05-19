//
//  GAHTTPRequest.h
//  GAHttpRequest
//
//  Created by 王文辉 on 11-7-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DefaultStringEncoding NSUTF8StringEncoding
#define GADefaultTimeOut	  30.0f

@protocol GAHTTPRequestDelegate;

//////////////////////////////////////////////////////////////////////////////////////////////

#define GARequestFileTypeJPG @"image/jpeg"
#define GARequestFileTypePNG @"image/png"
#define GARequestFileTypeMPG @"video/mpg"
#define GARequestFileTypeMP4 @"video/mpeg4"

//////////////////////////////////////////////////////////////////////////////////////////////

@interface GARequestFile : NSObject

@property (nonatomic, strong) NSData *fileData;
/* GARequestFileType */
@property (nonatomic, strong) NSString *fileType;
/* 文件名称，后缀名需要和fileType一致 */
@property (nonatomic, strong) NSString *fileName;

@end

//////////////////////////////////////////////////////////////////////////////////////////////

@interface GAHTTPRequest : NSObject {
	NSURLConnection		*conn_;
	NSMutableURLRequest	*request_;
	NSMutableData		*requestData_;
	
    NSMutableDictionary	*requestKey_;
    NSMutableDictionary	*requestFile_;
//    NSMutableDictionary *headers_;

	//
	NSInteger			requestID_;
	
	//
	id<GAHTTPRequestDelegate>	__unsafe_unretained delegate_;
    
    //
    unsigned long long  contentLength;
    unsigned long long  nowLength;
    
    //
    NSInteger           statusCode_;
    
    //
    NSString            *body_;
}

//属性 如果非需要 请勿修改
@property	(nonatomic)			NSInteger	requestID;
@property	(nonatomic, unsafe_unretained)	id<GAHTTPRequestDelegate>	delegate;
@property   (nonatomic, strong) NSMutableDictionary *requestKey;
@property   (nonatomic, readonly) NSMutableDictionary *requestFile;
@property   (nonatomic, readonly) NSInteger statusCode;
@property   (nonatomic, strong)   NSString  *body;
@property   (nonatomic, readonly) NSString  *url;


//初始化方法
- (id)initWithURL:(NSString *)newURL;
- (id)initWithURL:(NSString *)newURL AndRequestID:(NSInteger)requestID;
+ (id)requestWithURL:(NSString *)newURL;
+ (id)requestWithURL:(NSString *)newURL AndRequestID:(NSInteger)requestID;

- (void) setURL:(NSString *)url;

//开始
- (NSData *)startSynchronous;//同步
- (void)startAsynchronous;//异步

//取消
- (void)cancel;
+ (void)CancelAllRequest;
+ (void)CancelRequestByRequestID:(NSInteger)requestID;

//添加header
- (void)addRequestHeader:(NSString *)header value:(NSString *)value;

//添加PostValue
- (void)addPostValue:(NSString *)value forKey:(NSString *)key;
- (void)addData:(GARequestFile *)data forKey:(NSString *)key;;
- (void)clearPostValue;

+ (NSString *) HttpCoding:(NSString *)string;

@end

#pragma mark -
#pragma mark GAHTTPRequestDelegate
@protocol GAHTTPRequestDelegate <NSObject>
@required
- (void) completedWithData:(NSData *)data AndRequest:(GAHTTPRequest *)request;
@optional
- (void) failedWithError:(NSError *)error AndRequest:(GAHTTPRequest *)request;
- (void) dataReceiveProgress:(float)progress AndRequest:(GAHTTPRequest *)request;
- (void) responeWithStatusCode:(NSInteger)statusCode AndRequest:(GAHTTPRequest *)request;
@end