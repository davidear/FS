//
//  GAHTTPRequest.m
//  GAHttpRequest
//
//  Created by 王文辉 on 11-7-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GAHTTPRequest.h"

//////////////////////////////////////////////////////////////////////////////////////////////

@implementation GARequestFile

@end

//////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////

static NSMutableDictionary	*requestList_ = nil;
static NSInteger			requestCount  = 0;

NSString *GATWITTERFON_FORM_BOUNDARY = @"0194784892923";

////////////////////////////////////////////////////////////////////////

@interface GAHTTPRequest()

@property (nonatomic, strong) NSURLConnection	*conn;
@property (nonatomic, strong) NSMutableData		*requestData;

- (void) prepare;
//- (void) initCookie;

@end

////////////////////////////////////////////////////////////////////////

@implementation GAHTTPRequest
@synthesize conn	  = conn_;
@synthesize requestData	 = requestData_;
@synthesize delegate  = delegate_;
@synthesize requestKey = requestKey_;
@synthesize requestFile = requestFile_;
@synthesize statusCode = statusCode_;
@synthesize body = body_;

#pragma mark -
#pragma mark init
+ (void)initialize {
	requestList_ = [[NSMutableDictionary alloc] init];
}

- (id) init
{
    self = [super init];
    if (self) {
        requestID_ = requestCount;
		requestCount--;
        requestKey_ = [[NSMutableDictionary alloc] initWithCapacity:0];
        requestFile_ = [[NSMutableDictionary alloc] initWithCapacity:0];
//        headers_ = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    return self;
}

- (id)initWithURL:(NSString *)newURL {
    self = [self init];
	if (self) {
        
		request_ = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:newURL]
												cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
											timeoutInterval:GADefaultTimeOut];
        //[self initCookie];
	}
	return self;
}

+ (id)requestWithURL:(NSString *)newURL {
	GAHTTPRequest *httpRequest = [[GAHTTPRequest alloc] initWithURL:newURL];
	[requestList_ setObject:httpRequest forKey:[NSNumber numberWithInteger:httpRequest.requestID]];
	
	NSInteger rID = httpRequest.requestID;
	
	
	return (GAHTTPRequest *)[requestList_ objectForKey:[NSNumber numberWithInteger:rID]];
}

- (id)initWithURL:(NSString *)newURL AndRequestID:(NSInteger)requestID {
    self = [self init];
	if (self) {
		requestID_ = requestID;
		request_ = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:newURL]
												cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
											timeoutInterval:GADefaultTimeOut];
        //[self initCookie];
	}
	return self;
}

+ (id)requestWithURL:(NSString *)newURL AndRequestID:(NSInteger)requestID {
	GAHTTPRequest *httpRequest = [[GAHTTPRequest alloc] initWithURL:newURL
													   AndRequestID:requestID];
	[requestList_ setObject:httpRequest forKey:[NSNumber numberWithInteger:requestID]];
	
	
	return (GAHTTPRequest *)[requestList_ objectForKey:[NSNumber numberWithInteger:requestID]];
}


- (void) dealloc {
	self.delegate = nil;
	request_ = nil;
}


#pragma mark -
#pragma mark Functions

//- (void) initCookie
//{
////    NSArray *array = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
////    NSDictionary *dict = [NSHTTPCookie requestHeaderFieldsWithCookies:array];
////    [request_ setAllHTTPHeaderFields:dict];
//}

- (NSString *) url
{
    return [[request_ URL] absoluteString];
}

- (void) setURL:(NSString *)url
{
    if (self.conn) {
        [self.conn cancel];
        [self.conn unscheduleFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        self.conn = nil;
    }
    request_ = nil;
    request_ = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]
                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                        timeoutInterval:GADefaultTimeOut];
    //[self initCookie];
    //NSLog(@"%@", request_);
}

//开始
- (NSData *)startSynchronous {
	
    if ([[requestKey_ allKeys] count] > 0 || [[requestFile_ allKeys] count] > 0) {
        [self prepare];
    } else if ([body_ length] > 0) {
        [request_ setHTTPMethod:@"POST"];
        [request_ setHTTPBody:[body_ dataUsingEncoding:DefaultStringEncoding]];
    }
	
	NSError *error = nil;
	NSData *data = [NSURLConnection sendSynchronousRequest:request_
									  returningResponse:nil
												  error:&error];
	
	[requestList_ removeObjectForKey:[NSNumber numberWithInteger:requestID_]];
	
	if (error) {
		return nil;
	} else {
		return data;
	}
	return nil;
}

- (void)startAsynchronous {
    if ([[requestKey_ allKeys] count] > 0 || [[requestFile_ allKeys] count] > 0) {
        [self prepare];
    } else if ([body_ length] > 0) {
        [request_ setHTTPMethod:@"POST"];
        [request_ setHTTPBody:[body_ dataUsingEncoding:DefaultStringEncoding]];
    }
    
    nowLength = 0;
    
//////////////////////////////////////////////////////////////////////////////////////////
    
#if NeedLog
    
    NSLog(@"===============BeginTime===============");
    time_t t;
    t = time(NULL);
    NSLog(@"%ld", time(&t));
    NSLog(@"===============BeginTime End ==========");
    
#endif
    
//////////////////////////////////////////////////////////////////////////////////////////    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request_ delegate:self startImmediately:NO];
    [connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    self.conn = connection;
    [self.conn start];
	
	//conn_ = [[NSURLConnection alloc] initWithRequest:request_ delegate:self];
//	self.conn = [NSURLConnection connectionWithRequest:request_ delegate:self];
//	[conn_ start];
	//[self.conn start];
}

- (void) setRequestID:(NSInteger)newID {
	//[requestList_ removeObjectForKey:[NSNumber numberWithInt:requestID_]];
	NSInteger oldID = requestID_;
	GAHTTPRequest *req = [requestList_ objectForKey:[NSNumber numberWithInteger:oldID]];
	if (req) {
		[requestList_ setObject:req forKey:[NSNumber numberWithInteger:newID]];
		[requestList_ removeObjectForKey:[NSNumber numberWithInteger:oldID]];
	}
	
	requestID_ = newID;
	
}

- (NSInteger) requestID {
	return requestID_;
}

//取消
- (void)cancel {
	//if (delegate_ && [delegate_ respondsToSelector:@selector(FailedWithError:AndRequestID:)]) {
//		[delegate_ FailedWithError:nil AndRequestID:requestID_];
//	}
	
	self.delegate = nil;
    
	
	[self.conn cancel];
    
    [self.conn unscheduleFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
	self.conn = nil;
	self.requestData = nil;
	
	[requestList_ removeObjectForKey:[NSNumber numberWithInteger:requestID_]];

}

+ (void)CancelAllRequest {
	NSArray *array = [requestList_ allValues];
	[array makeObjectsPerformSelector:@selector(cancel)];
}

+ (void)CancelRequestByRequestID:(NSInteger)requestID {
	NSNumber *number = [NSNumber numberWithInteger:requestID];
	GAHTTPRequest *req = (GAHTTPRequest *)[requestList_ objectForKey:number];
	[req cancel];
}

//添加header
- (void)addRequestHeader:(NSString *)header value:(NSString *)value {
    [request_ addValue:value forHTTPHeaderField:header];
   // [headers_ setObject:value forKey:header];
}

//添加PostValue
- (void)addPostValue:(NSString *)value forKey:(NSString *)key 
{
    if (value && key) {
        [requestKey_ setObject:value forKey:key];
    }
}

- (void)addData:(GARequestFile *)data forKey:(NSString *)key
{
    if (data && key) {
        [requestFile_ setObject:data forKey:key];
    }
}

- (void)clearPostValue
{
    [self.conn cancel];
    self.conn = nil;
    [requestFile_ removeAllObjects];
    [requestKey_ removeAllObjects];
}

//编码
+ (NSString *) HttpCoding:(NSString *)string {
	NSString *newStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8));
	NSString *codingStr = [NSString stringWithString:newStr];
	
	return codingStr;
}

//合成
- (void) prepare
{
    NSArray* keys = [requestKey_ allKeys];
	NSString* result = [NSString string];
	int i;
	for (i = 0; i < [keys count]; i++) {
        result = [result stringByAppendingString:
                  [@"--" stringByAppendingString:
                   [GATWITTERFON_FORM_BOUNDARY stringByAppendingString:
                    [@"\r\nContent-Disposition: form-data; name=\"" stringByAppendingString:
                     [[keys objectAtIndex: i] stringByAppendingString:
                      [@"\"\r\n\r\n" stringByAppendingString:
                       [[requestKey_ valueForKey: [keys objectAtIndex: i]] stringByAppendingString: @"\r\n"]]]]]]];
	}
    
#if NeedLog
    
    NSLog(@"%@", result);
    
#endif
    
    NSMutableData *data = [NSMutableData data];
    [data appendData:[result dataUsingEncoding:DefaultStringEncoding]];
    
    NSString *footer = [NSString stringWithFormat:@"\r\n--%@--\r\n", GATWITTERFON_FORM_BOUNDARY];
    
    NSArray *filekeys = [requestFile_ allKeys];
    for (int j = 0; j < [filekeys count]; j++) {
        
        GARequestFile *file = [requestFile_ objectForKey:[filekeys objectAtIndex:j]];
        
        NSString *keydata = [NSString stringWithFormat:@"--%@\r\n", GATWITTERFON_FORM_BOUNDARY];
        // keydata = [keydata stringByAppendingString:@"Content-Disposition: form-data; name=\"upfile\";filename=\"image.jpg\"\r\nContent-Type: image/jpeg\r\n\r\n"];
        
        keydata = [keydata stringByAppendingFormat:@"Content-Disposition: form-data; name=\"%@\";filename=\"%@\"\r\nContent-Type: %@\r\n\r\n", [filekeys objectAtIndex:j], file.fileName, file.fileType];
        
        [data appendData:[keydata dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:file.fileData];
        [data appendData:[footer dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", GATWITTERFON_FORM_BOUNDARY];
    [request_ setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [request_ setValue:[NSString stringWithFormat:@"%ld", (long)[data length]]forHTTPHeaderField:@"Content-Length"];
    [request_ setHTTPMethod:@"POST"];
    [request_ setHTTPBody:data];
    
//    if ([[headers_ allKeys] count] > 0) {
//        [request_ setAllHTTPHeaderFields:headers_];
//    }
}

#pragma mark -
#pragma mark NSURLConnection Delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response 
{
    
//////////////////////////////////////////////////////////////////////////////////////////
#if NeedLog
    
    NSLog(@"===============ResponseTime===============");
    time_t t;
    t = time(NULL);
    NSLog(@"%ld", time(&t));
    NSLog(@"===============ResponseTime End ==========");
    
#endif
    
//////////////////////////////////////////////////////////////////////////////////////////
    
	self.requestData = [NSMutableData data];
    
    contentLength = [response expectedContentLength];
    
    NSHTTPURLResponse *resp = (NSHTTPURLResponse*)response;
    if (resp) {
        statusCode_ = resp.statusCode;
//        NSLog(@"%@", [resp allHeaderFields]);
//        NSLog(@"S:%d", statusCode_);
        
        if (delegate_ && [delegate_ respondsToSelector:@selector(responeWithStatusCode:AndRequest:)]) {
            [delegate_ responeWithStatusCode:statusCode_ AndRequest:self];
        }
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
	[self.requestData appendData:data];
    
    nowLength += [data length];
    
    if (delegate_ && [delegate_ respondsToSelector:@selector(dataReceiveProgress:AndRequest:)]) {
        float p = (float)nowLength / contentLength;
        [delegate_ dataReceiveProgress:(p<0?0:p) AndRequest:self];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error 
{
	self.conn = nil;
	self.requestData = nil;
    
    NSLog(@"%@", error);
	
	if (delegate_ && [delegate_ respondsToSelector:@selector(failedWithError:AndRequest:)]) {
		[delegate_ failedWithError:error AndRequest:self];
	}
	[requestList_ removeObjectForKey:[NSNumber numberWithInteger:requestID_]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
{
    
//////////////////////////////////////////////////////////////////////////////////////////
#if NeedLog
    
    NSLog(@"===============FinishTime===============");
    time_t t;
    t = time(NULL);
    NSLog(@"%ld", time(&t));
    NSLog(@"===============FinishTime End ==========");
    
    NSLog(@"--%@", [[NSString alloc] initWithData:self.requestData encoding:NSUTF8StringEncoding]);
    
#endif
    
//////////////////////////////////////////////////////////////////////////////////////////

	if (delegate_ && [delegate_ respondsToSelector:@selector(completedWithData:AndRequest:)]) {
		[delegate_ completedWithData:self.requestData AndRequest:self];
	}
	
	self.conn = nil;
	self.requestData = nil;
	[requestList_ removeObjectForKey:[NSNumber numberWithInteger:requestID_]];
    
//    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
//        NSLog(@"%@", cookie);
//    }
}
@end