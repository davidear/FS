//
//  NSMutableAttributedString+GAExtention.m
//  TuJia
//
//  Created by 王文辉 on 12-10-25.
//  Copyright (c) 2012年 途家. All rights reserved.
//

#import "NSAttributedString+GAExtention.h"

@implementation NSMutableAttributedString (GAExtention)

#if __has_feature(objc_arc)
#define BRIDGE_CAST __bridge
#define MRC_AUTORELEASE(x) (x)
#else
#define BRIDGE_CAST
#define MRC_AUTORELEASE(x) [(x) autorelease]
#endif

-(void)setFont:(UIFont *)font range:(NSRange)range
{
	// kCTFontAttributeName
	CTFontRef aFont = CTFontCreateWithName((BRIDGE_CAST CFStringRef)font.fontName, font.pointSize, NULL);
	if (aFont)
    {
        [self removeAttribute:(BRIDGE_CAST NSString*)kCTFontAttributeName range:range]; // Work around for Apple leak
        [self addAttribute:(BRIDGE_CAST NSString*)kCTFontAttributeName value:(BRIDGE_CAST id)aFont range:range];
        CFRelease(aFont);
    }
}

- (void)setTextColor:(UIColor*)color range:(NSRange)range
{
	[self removeAttribute:(BRIDGE_CAST NSString*)kCTForegroundColorAttributeName range:range];
	[self addAttribute:(BRIDGE_CAST NSString*)kCTForegroundColorAttributeName value:(BRIDGE_CAST id)color.CGColor range:range];
}


-(void)setTextAlignment:(CTTextAlignment)alignment lineBreakMode:(CTLineBreakMode)lineBreakMode
{
	[self setTextAlignment:alignment lineBreakMode:lineBreakMode range:NSMakeRange(0,[self length])];
}

-(void)setTextAlignment:(CTTextAlignment)alignment lineBreakMode:(CTLineBreakMode)lineBreakMode range:(NSRange)range
{
	CTParagraphStyleSetting paraStyles[2] = {
		{.spec = kCTParagraphStyleSpecifierAlignment, .valueSize = sizeof(CTTextAlignment), .value = (const void*)&alignment},
		{.spec = kCTParagraphStyleSpecifierLineBreakMode, .valueSize = sizeof(CTLineBreakMode), .value = (const void*)&lineBreakMode},
	};
	CTParagraphStyleRef aStyle = CTParagraphStyleCreate(paraStyles, 2);
	[self removeAttribute:(BRIDGE_CAST NSString*)kCTParagraphStyleAttributeName range:range];	[self addAttribute:(BRIDGE_CAST NSString*)kCTParagraphStyleAttributeName value:(BRIDGE_CAST id)aStyle range:range];
	CFRelease(aStyle);
}

@end
