//
//  ConfigMacro.h
//  demo
//
//  Created by Mingo on 16/10/2.
//  Copyright © 2016年 袁凤鸣. All rights reserved.
//↓↑‖◈▣✄▼▼▼▼▼▲▲▲▲▲↖↖↖↘↘↙↙↗↗➹➹➹☠▽▽▽△△♤♡

#ifndef ConfigMacro_h
#define ConfigMacro_h

//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width       //屏幕宽度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height      //屏幕高度
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size             //屏幕大小
#define kWindow       [UIApplication sharedApplication].keyWindow
#define KFit6P_W(WIDTH)  ((WIDTH) /(1920.0/2208.0))/3.0 * ((SCREEN_WIDTH)/414.0)
#define KFit6P_H(HEIGHT)  ((HEIGHT) /(1920.0/2208.0))/3.0 * ((SCREEN_HEIGHT /736.0))
#define KFit6S_W(WIDTH)  ((WIDTH)/2.0*((SCREEN_WIDTH)/375.0))
#define KFit6S_H(HEIGHT)  ((HEIGHT)/2.0*((SCREEN_HEIGHT)/667.0))
#define MFont(f) [UIFont systemFontOfSize:f]
#define kFit6Font(x) (SCREEN_WIDTH*((x)/375.0))

//主题颜色
#define GGColor kRGBColor(255,0,51)

//设置状态栏文字样式颜色
#define KStatusBarHidden(StatusBool) [UIAppliction sharedApplication] setStatusBarHidden :StatusBool];
#define KStatusBarStyle(UIStatusBarStyleLightContent) [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//弱引用/强引用
#define kWeakSelf(type)   __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type


//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 颜色 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
//颜色
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor  [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:arc4random_uniform(256)/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]

#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
#define KFMGray [UIColor YFM_colorWithHexString:@"838383"]

//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 图片 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
//读取本地图片
#define kLoadImage(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
//定义UIImage对象
#define kIMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
//获取图片；前面2种性能比这个高，但这个常用，assets.xcassets里的用这个吧
#define kImageName(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ ALERT 弹框 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
// alert弹框,只需要一行代码就能完成弹窗提醒
#define alert(string, detail) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:string message:detail preferredStyle:UIAlertControllerStyleAlert]; \
UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]; \
[alertController addAction:okAction]; \
[self presentViewController:alertController animated:YES completion:nil];

//普通的alert view
#define kALERT(info)\
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:info delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];\
[alert show];
//普通的alert view 该功能正在开发中ing,稍后开放！
#define FM_ALERT_FEATURE_DEVELOPMENT UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该功能正在开发中ing,稍后开放！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];\
[alert show];

//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼    ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
//设置 view 圆角和边框
#define YFM_SET_ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#define LRDegreesToRadian(x) (M_PI * (x) / 180.0)           //由角度转换弧度
#define LRRadianToDegrees(radian) (radian*180.0)/(M_PI)     //由弧度转换角度

#define SAFE_DELETE(P) if(P) { [P release], P = nil; }      //删除一个对象
#define SAFE_RELEASE(x) [x release];x=nil                   //释放一个对象



//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ GCD ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 使用时()括号内需要自己加上 ^{}
//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#define keyPath(objc,keyPath) @(((void)objc.keyPath, #keyPath))



//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ Frame操作相关 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
//获取垂直居中的x（父的高度/2-子的高度/2）
#define CENTER_VERTICALLY(parent,child) floor((parent.frame.size.height - child.frame.size.height) / 2)
//获取水平居中的y（父的宽度/2-子的宽度/2）
#define CENTER_HORIZONTALLY(parent,child) floor((parent.frame.size.width - child.frame.size.width) / 2)

// example: [[UIView alloc] initWithFrame:(CGRect){CENTER_IN_PARENT(parentView,500,500),CGSizeMake(500,500)}];
#define CENTER_IN_PARENT(parent,childWidth,childHeight) CGPointMake(floor((parent.frame.size.width - childWidth) / 2),floor((parent.frame.size.height - childHeight) / 2))
#define CENTER_IN_PARENT_X(parent,childWidth) floor((parent.frame.size.width - childWidth) / 2)
#define CENTER_IN_PARENT_Y(parent,childHeight) floor((parent.frame.size.height - childHeight) / 2)


//+=========================== Mingo ADD

#define emptyListView_W kFit6Font(100)

#define FM_ALLOC_INIT(PleaseWriteClassName) [[PleaseWriteClassName alloc] init]
#define Alloc_Init(objc) [[objc alloc] init];

#define FM_SELF_NAV_PUSH_VIEWCONTROLLER_WITH_ANIMATED(WriteObjectName)  [self.navigationController pushViewController:WriteObjectName animated:YES]
#define FM_HUD_NETWORK_ERROR  [SVProgressHUD showErrorWithStatus:@"网络错误，请稍后尝试！"];
#define FM_HUD_NETWORK_CONNECTING [SVProgressHUD showWithStatus:@"加载中..."];
#define FM_HUD_DISMISS [SVProgressHUD dismiss];
#define FM_HUD_ERROR_WITH_RESPONSE_MESSAGE [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
#define FM_HUD_SUCCESS_WITH_RESPONSE_MESSAGE [SVProgressHUD showSuccessWithStatus:responseObject[@"message"]];


 



#endif /* ConfigMacro_h */
