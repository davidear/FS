//
//  Global.h
//  Artgogo
//
//  Created by 王文辉 on 13-11-5.
//  Copyright (c) 2013年 王文辉. All rights reserved.
//

#ifndef Artgogo_Global_h
#define Artgogo_Global_h

//
#define kNavBarHeight 44.f
#define kTabbarHeight 49.f
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height-20.f

//
#define JsonCallBackKey @"c"

//
#define kVersion7 (([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)?YES:NO)
#define kVersion6 (([[[UIDevice currentDevice] systemVersion] doubleValue]>=6.0)?YES:NO)
#define kStatusHeight ((kVersion7)?20.f:0.f)


//
#define kCartChangedNotification @"kCartChangedNotification"
#define kCartChangedKey          @"kCartChangedKey"

//
#define kGreyColorN     [UIColor colorWithRed:0.509804 green:0.509804 blue:0.509804 alpha:1.0]
#define kRedColor       [UIColor colorWithRed:0.878431 green:0.003922 blue:0.003922 alpha:1.0]
#define kGreyColor      [UIColor colorWithRed:0.717647 green:0.717647 blue:0.717647 alpha:1.0]
#define kWhiteColor     [UIColor whiteColor]
#define kGreyColor1     [UIColor colorWithRed:0.662745 green:0.650980 blue:0.650980 alpha:1.0]
#define kGreyColor2     [UIColor colorWithRed:0.423529 green:0.423529 blue:0.423529 alpha:1.0]
#define kGreyColor3     [UIColor colorWithRed:0.929412 green:0.929412 blue:0.929412 alpha:1.0]
#define kOrangeColor    [UIColor colorWithRed:0.949020 green:0.447059 blue:0.109804 alpha:1.0]
#define kBlackColor     [UIColor colorWithRed:0.447059 green:0.447059 blue:0.447059 alpha:1.0]
#define kBlueColor      [UIColor colorWithRed:0.235294 green:0.556863 blue:0.894118 alpha:1.0]
#define kBorderColor    [UIColor colorWithRed:0.815686 green:0.815686 blue:0.815686 alpha:1.0]
#define kGreyColor4     [UIColor colorWithRed:0.878431 green:0.878431 blue:0.878431 alpha:1.0]
#define KGreenColor     [UIColor colorWithRed:0.364706 green:0.635294 blue:0.215686 alpha:1.0]
//Font
#define kFontLarge      [UIFont systemFontOfSize:17.f]
#define kFontMiddle     [UIFont systemFontOfSize:16.f]
#define kFontSmall      [UIFont systemFontOfSize:14.f]
#define kFontSmallM     [UIFont systemFontOfSize:12.f]
#define kFontSmaller    [UIFont systemFontOfSize:11.f]

//
#define kBaseURL        @"http://app.nntv.cn/"
#define kBaseURL1       @"http://180.141.89.20:2080/"
#define kBaseURL2       @"http://user.nntv.cn/nnplatform/"
#define kImageBaseUrl   @"http://www.artgogo.com/"


//
#define kAdTag          3000

//
#define NetError        @"网络错误，请重试！"

#define UmengAppkey     @"535fc6cd56240beabd0250c4"

#endif
