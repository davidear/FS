//
//  GARefreshTableHeaderView.m
//  XingHui
//
//  Created by 王文辉 on 11-5-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GARefreshTableFooterView.h"


#define TEXT_COLOR	 [UIColor colorWithRed:0.227451 green:0.227451 blue:0.227451 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f


@interface GARefreshTableFooterView (Private)
- (void)setState:(GAPullRefreshState)aState;
@end

@implementation GARefreshTableFooterView

@synthesize delegate=_delegate;


- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor  {
    if (self = [super initWithFrame:frame]) {
		
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.clipsToBounds = YES;
		//self.backgroundColor = kWhiteColor;

		_lastUpdatedLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 26.0f, 120.f, 20.0f)];
		//_lastUpdatedLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		_lastUpdatedLabel.font = [UIFont systemFontOfSize:8.0f];
		_lastUpdatedLabel.textColor = textColor;
		_lastUpdatedLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		_lastUpdatedLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
		_lastUpdatedLabel.backgroundColor = [UIColor clearColor];
		_lastUpdatedLabel.textAlignment = NSTextAlignmentCenter;
		[self addSubview:_lastUpdatedLabel];
		
		_statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0f, 11.0f, 120.f, 20.0f)];
		//_statusLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		_statusLabel.font = [UIFont systemFontOfSize:10.0f];
		_statusLabel.textColor = textColor;
		_statusLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		_statusLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
		_statusLabel.backgroundColor = [UIColor clearColor];
		_statusLabel.textAlignment = NSTextAlignmentCenter;
		[self addSubview:_statusLabel];
        
        _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(72.f, 17.f, 19.f, 24.f)];
        _arrowImage.image = [UIImage imageNamed:arrow];
		[self addSubview:_arrowImage];
		
		_activityView = [[UIImageView alloc] initWithFrame:CGRectMake(72.5f, 19.f, 20.0f, 20.0f)];
        _activityView.image = [UIImage imageNamed:@"refresh_icon"];
        _activityView.hidden = YES;
		[self addSubview:_activityView];
		
		
		[self setState:GAOPullRefreshNormal];
		
    }
	
    return self;
	
}

- (id)initWithFrame:(CGRect)frame  {
  return [self initWithFrame:frame arrowImageName:@"redArrow.png" textColor:TEXT_COLOR];
}

#pragma mark -
#pragma mark Setters

- (void)refreshLastUpdatedDate {
	
	if ([_delegate respondsToSelector:@selector(GARefreshTableHeaderDataSourceLastUpdated:)]) {
		
		NSDate *date = [_delegate GARefreshTableHeaderDataSourceLastUpdated:self];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
		_lastUpdatedLabel.text = [NSString stringWithFormat:@"最后更新时间:%@",[formatter stringFromDate:date]];
		[[NSUserDefaults standardUserDefaults] setObject:_lastUpdatedLabel.text forKey:@"GARefreshTableView_LastRefresh"];
		[[NSUserDefaults standardUserDefaults] synchronize];
		
	} else {
		
		_lastUpdatedLabel.text = nil;
		
	}

}

//- (void)refreshDataByOwn:(UIScrollView *)scrollView {
//	BOOL _loading = NO;
//	if ([_delegate respondsToSelector:@selector(GARefreshTableHeaderDataSourceIsLoading:)]) {
//		_loading = [_delegate GARefreshTableHeaderDataSourceIsLoading:self];
//	}
////	
////	NSLog(@"%@",)
//	
//	if (!_loading) {
//		if ([_delegate respondsToSelector:@selector(GARefreshTableHeaderDidTriggerRefresh:)]) {
//			[_delegate GARefreshTableHeaderDidTriggerRefresh:self];
//		}
//		
//		//NSLog(@"%@", scrollView);
//		
//		[self setState:GAOPullRefreshLoading];
//		//[scrollView scrollRectToVisible:CGRectMake(0.0f, -65.0f, 320.0f, 65.0f) animated:YES];
//		[UIView beginAnimations:nil context:NULL];
//		[UIView setAnimationDuration:0.2];
//		scrollView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
//		scrollView.contentOffset = CGPointMake(0.0f, -60.0f);
//		[UIView commitAnimations];
//	}
//	
//}

- (void)setState:(GAPullRefreshState)aState{
	
	switch (aState) {
		case GAOPullRefreshPulling:
			
			//_statusLabel.text = NSLocalizedString(@"Release to refresh...", @"Release to refresh status");
			_statusLabel.text = @"松开即可刷新...";
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
			_arrowImage.layer.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
            
             [_activityView.layer removeAnimationForKey:@"transform"];
			
			break;
		case GAOPullRefreshNormal:
			
			if (_state == GAOPullRefreshPulling) {
				[CATransaction begin];
				[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
				_arrowImage.layer.transform = CATransform3DIdentity;
				[CATransaction commit];
			}
			
			//_statusLabel.text = NSLocalizedString(@"Pull down to refresh...", @"Pull down to refresh status");
			_statusLabel.text = @"上拉加载更多";
            _activityView.hidden = YES;
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = NO;
			_arrowImage.layer.transform = CATransform3DIdentity;
			[CATransaction commit];
			
			[self refreshLastUpdatedDate];
            
            [_activityView.layer removeAnimationForKey:@"transform"];
			
			break;
		case GAOPullRefreshLoading:
        {
			//_statusLabel.text = NSLocalizedString(@"Loading...", @"Loading Status");
			_statusLabel.text = @"加载中...";
            
            _activityView.hidden = NO;
            CALayer *layer = _activityView.layer;
            
            CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            
            animation.fromValue = [NSNumber numberWithDouble:0];
            animation.byValue = [NSNumber numberWithInt:1];
            animation.toValue = [NSNumber numberWithDouble:M_PI];
            
            animation.fillMode = kCAFillModeForwards;
            animation.cumulative = YES;
            animation.additive = NO;
            animation.repeatCount = 10000;
            animation.removedOnCompletion = YES;
            animation.duration = 0.6;
            [layer addAnimation:animation forKey:@"transform"];
//			[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = YES;
			[CATransaction commit];
        }
			break;
		default:
			break;
	}
	
	_state = aState;
}


#pragma mark -
#pragma mark ScrollView Methods

- (void)GARefreshScrollViewDidScroll:(UIScrollView *)scrollView {	
	
	if (_state == GAOPullRefreshLoading) {
		
//		CGFloat offset = MAX(scrollView.contentOffset.y, 0);
//		offset = MIN(offset, 60);
		scrollView.contentInset = UIEdgeInsetsMake(0.f, 0.0f, BottomHeight, 0.0f);
		
	} else if (scrollView.isDragging) {
		
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(GARefreshTableHeaderDataSourceIsLoading:)]) {
			_loading = [_delegate GARefreshTableHeaderDataSourceIsLoading:self];
		}
        
//        NSLog(@"%f %f", scrollView.contentOffset.y+scrollView.bounds.size.height, scrollView.contentSize.height);
        
        float maxH = scrollView.contentSize.height-scrollView.bounds.size.height;
		
		if (_state == GAOPullRefreshPulling && scrollView.contentOffset.y < maxH + BottomHeight && scrollView.contentOffset.y > maxH && !_loading) {
			[self setState:GAOPullRefreshNormal];
		} else if (_state == GAOPullRefreshNormal && scrollView.contentOffset.y > maxH + BottomHeight && !_loading) {
			[self setState:GAOPullRefreshPulling];
		}
		
		if (scrollView.contentInset.top != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
	}
}

- (void)GARefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
	
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(GARefreshTableHeaderDataSourceIsLoading:)]) {
		_loading = [_delegate GARefreshTableHeaderDataSourceIsLoading:self];
	}
	
	if (scrollView.contentOffset.y >= scrollView.contentSize.height-scrollView.bounds.size.height+BottomHeight && !_loading) {
		
		if ([_delegate respondsToSelector:@selector(GARefreshTableHeaderDidTriggerRefresh:)]) {
			[_delegate GARefreshTableHeaderDidTriggerRefresh:self];
		}
		
		[self setState:GAOPullRefreshLoading];
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		scrollView.contentInset = UIEdgeInsetsMake(0.f, 0.0f, BottomHeight, 0.0f);
		[UIView commitAnimations];
		
	}
	
	//scrollView.contentOffset = CGPointMake(0, 0);
}

- (void)GARefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {	
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	[scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.f, 0.0f)];
	
	[UIView commitAnimations];
	
	[self setState:GAOPullRefreshNormal];
	
	
//	scrollView.contentOffset = CGPointMake(0, 0);
}


#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
	_delegate=nil;
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
	_lastUpdatedLabel = nil;
}


@end
