//
//  DetailViewController.h
//  FS
//
//  Created by jason on 2017/5/16.
//  Copyright © 2017年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

