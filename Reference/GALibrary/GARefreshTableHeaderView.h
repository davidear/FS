//
//  GARefreshTableHeaderView.h
//  XingHui
//
//  Created by 王文辉 on 11-5-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
	PullRefreshPulling = 0,
	PullRefreshNormal,
	PullRefreshLoading,	
} PullRefreshState;

@protocol GARefreshTableHeaderDelegate;
@interface GARefreshTableHeaderView : UIView {
	
	id __unsafe_unretained _delegate;
	PullRefreshState _state;
    
	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	UIImageView *_arrowImage;
	UIImageView *_activityView;

}

@property(nonatomic,unsafe_unretained) id <GARefreshTableHeaderDelegate> delegate;

- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor;

- (void)refreshDataByOwn:(UIScrollView *)scrollView;
- (void)refreshLastUpdatedDate;
- (void)refreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)refreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)refreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end
@protocol GARefreshTableHeaderDelegate
- (void)refreshTableHeaderDidTriggerRefresh:(GARefreshTableHeaderView*)view;
- (BOOL)refreshTableHeaderDataSourceIsLoading:(GARefreshTableHeaderView*)view;
@optional
- (NSDate*)refreshTableHeaderDataSourceLastUpdated:(GARefreshTableHeaderView*)view;
@end
