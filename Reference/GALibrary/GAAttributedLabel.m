//
//  GAAttributedLabel.m
//  TuJia
//
//  Created by 王文辉 on 12-10-25.
//  Copyright (c) 2012年 途家. All rights reserved.
//

#import "GAAttributedLabel.h"

#if __has_feature(objc_arc)
#define BRIDGE_CAST __bridge
#define MRC_RETAIN(x) (x)
#define MRC_RELEASE(x)
#define MRC_AUTORELEASE(x) (x)
#else
#define BRIDGE_CAST
#define MRC_RETAIN(x) [x retain]
#define MRC_RELEASE(x) [x release]; x = nil
#define MRC_AUTORELEASE(x) [x autorelease]
#endif

@interface GAAttributedLabel()

- (void) removeText;

@end

@implementation GAAttributedLabel
@synthesize verticalAlignment;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) removeText
{
    attributedText = nil;
    if (textFrame)
    {
		CFRelease(textFrame);
		textFrame = NULL;
	}
}

- (void) setAttributedText:(NSAttributedString *)text
{
    [self removeText];
    attributedText = text;
    [self setNeedsDisplay];
}

- (NSAttributedString *) attributedText
{
    return attributedText;
}

- (void)drawTextInRect:(CGRect)aRect
{
    
	if (attributedText)
    {
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		CGContextSaveGState(ctx);
		
		CGContextConcatCTM(ctx, CGAffineTransformScale(CGAffineTransformMakeTranslation(0, self.bounds.size.height), 1.f, -1.f));
		
		if (self.shadowColor)
        {
			CGContextSetShadowWithColor(ctx, self.shadowOffset, 0.0, self.shadowColor.CGColor);
		}
		
		if (textFrame == NULL)
        {
            CFAttributedStringRef cfAttrStrWithLinks = (BRIDGE_CAST CFAttributedStringRef)attributedText;
			CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(cfAttrStrWithLinks);
			CGMutablePathRef path = CGPathCreateMutable();
            
            CGRect drawingRect;
            
            if (UIEdgeInsetsEqualToEdgeInsets(self.margin, UIEdgeInsetsZero)) {
                drawingRect = self.bounds;
            } else {
                drawingRect = UIEdgeInsetsInsetRect(self.bounds, self.margin);
            }
            
            if (verticalAlignment == GAVerticalAlignmentBottom || verticalAlignment == GAVerticalAlignmentMiddle) {
                CGSize sz = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0,0),NULL,CGSizeMake(drawingRect.size.width,CGFLOAT_MAX),NULL);
				if (verticalAlignment == GAVerticalAlignmentMiddle) {
					drawingRect.origin.y -= (drawingRect.size.height - sz.height)/2;
				} else {
                    drawingRect.origin.y -= (drawingRect.size.height - sz.height);
                }
            }
            
			CGPathAddRect(path, NULL, drawingRect);
			textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
			CGPathRelease(path);
			CFRelease(framesetter);
		}
		
		CTFrameDraw(textFrame, ctx);
        
		CGContextRestoreGState(ctx);
	} else {
		[super drawTextInRect:UIEdgeInsetsInsetRect(aRect, self.margin)];
	}
}

- (void) dealloc
{
    [self removeText];
}

@end
