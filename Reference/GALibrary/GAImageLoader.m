//
//  GAImageLoader.m
//  artlem
//
//  Created by 王文辉 on 12-10-28.
//  Copyright (c) 2012年 Green Apple. All rights reserved.
//

#import "GAImageLoader.h"

@interface GAImageLoader()

@property (nonatomic, strong) NSURLConnection *conn;
@property (nonatomic, strong) NSMutableData   *data;

@end

@implementation GAImageLoader
@synthesize delegate = delegate_;
@synthesize url = url_;

- (id) initWithURL:(NSString *)url
{
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void) dealloc
{
    [self cancel];
}

- (void) start
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    self.conn = connection;
    [self.conn start];
}

- (void) cancel
{
    if (self.conn) {
        self.delegate = nil;
        [self.conn unscheduleFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        [self.conn cancel];
        self.conn = nil;
        self.data = nil;
    }
}

#pragma mark -
#pragma mark NSURLConnection Delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    statusCode_ = [(NSHTTPURLResponse *)response statusCode];
	self.data = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[self.data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	self.conn = nil;
	self.data = nil;
	
	if (delegate_ && [delegate_ respondsToSelector:@selector(imageDownloader:didFailWithError:)]) {
		[delegate_ imageDownloader:self didFailWithError:error];
	}
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (statusCode_ == 404) return;
	if (delegate_ && [delegate_ respondsToSelector:@selector(imageDownloader:didFinishWithImage:)]) {
		[delegate_ imageDownloader:self didFinishWithImage:self.data];
	}
	
	self.conn = nil;
	self.data = nil;
}

@end
