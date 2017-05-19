//
//  EGORefreshTableHeaderView.h
//  XingHui
//
//  Created by 王文辉 on 11-5-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define BottomHeight 60.0f

typedef enum{
	GAOPullRefreshPulling = 0,
	GAOPullRefreshNormal,
	GAOPullRefreshLoading,
} GAPullRefreshState;

@protocol GARefreshTableFooterDelegate;
@interface GARefreshTableFooterView : UIView {
	
	id __unsafe_unretained _delegate;
	GAPullRefreshState _state;

	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	UIImageView *_arrowImage;
	UIImageView *_activityView;
	

}

@property(nonatomic,unsafe_unretained) id <GARefreshTableFooterDelegate> delegate;

- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor;

//- (void)refreshDataByOwn:(UIScrollView *)scrollView;
- (void)refreshLastUpdatedDate;
- (void)GARefreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)GARefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)GARefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end
@protocol GARefreshTableFooterDelegate
- (void)GARefreshTableHeaderDidTriggerRefresh:(GARefreshTableFooterView*)view;
- (BOOL)GARefreshTableHeaderDataSourceIsLoading:(GARefreshTableFooterView*)view;
@optional
- (NSDate*)GARefreshTableHeaderDataSourceLastUpdated:(GARefreshTableFooterView*)view;
@end
