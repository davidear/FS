//
//  GAPanScrollView.m
//  TideNews
//
//  Created by 王文辉 on 14-5-14.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "GAPanScrollView.h"

@implementation GAPanScrollView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.panGestureRecognizer addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"state"]) {
        [self.target performSelectorOnMainThread:self.selector withObject:[NSNumber numberWithInteger:self.panGestureRecognizer.state] waitUntilDone:NO];
    }
}

- (void) dealloc
{
    [self.panGestureRecognizer removeObserver:self forKeyPath:@"state" context:NULL];
}

@end
