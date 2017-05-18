//
//  SAIConstant.h
//  sai-iOS
//
//  Created by DaiFengyi on 15/9/24.
//  Copyright © 2015年 Malong Tech. All rights reserved.
//

#ifndef SAIConstant_h
#define SAIConstant_h

//#define ACTION_SHOWLOGIN      @"ACTION_SHOWLOGIN"
#pragma mark - Action
//#define EVENT_LOGIN_CANCEL      @"EVENT_LOGIN_CHANGE"
#define ACTION_JUNP_MAINPAGE @"ACTION_JUNP_MAINPAGE"
#define ACTION_AROUSE_CAMARA @"ACTION_AROUSE_CAMARA"
#define ACTION_AROUSE_PHOTOLIBRARY @"ACTION_AROUSE_PHOTOLIBRARY"

#pragma mark discovery

#define ACTION_PUSH_INTO_NAV @"ACTION_PUSH_INTO_NAV"

#pragma mark - Status
#define STATUS_CURRENTUSERINFO_CHANGED @"STATUS_CURRENTUSERINFO_CHANGED"
#define STATUS_MYPOSTRESULTSTORE_CHANGED @"STATUS_MYPOSTRESULTSTORE_CHANGED"
#define STATUS_BADGENUMBER_CHANGED @"STATUS_BADGENUMBER_CHANGED"

#pragma mark features

typedef enum { SAIFeatureMatch = 0, SAIFeatureSame } SAIFeatures;

#pragma mark - Other
#define WEB_INTERFACE_OBJECT @"iOS_Window"
#define MAX_LOCAL_NUMBER 20
#endif /* SAIConstant_h */
