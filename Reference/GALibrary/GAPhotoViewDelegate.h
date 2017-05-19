//
//  GAPhotoViewDelegate.h
//  TuJia
//
//  Created by 王文辉 on 13-5-22.
//  Copyright (c) 2013年 途家. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GAPhotoView;

@protocol GAPhotoViewDelegate <NSObject>

@optional

- (void) photoDidTouched:(GAPhotoView *)photoView;
- (void) photoDidScrollToIndex:(NSUInteger)index;

- (void) hideNavBar;

//Override UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

@end
