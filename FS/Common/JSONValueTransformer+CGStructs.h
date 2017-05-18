#import "JSONValueTransformer.h"
#import <UIKit/UIKit.h>

@interface JSONValueTransformer (CGStructs)
// CGPoint
- (id)CGPointFromNSString:(NSString *)string;
- (id)JSONObjectFromCGPoint:(NSValue *)pointValue;

// CGSize
- (id)CGSizeFromNSString:(NSString *)string;
- (id)JSONObjectFromCGSize:(NSValue *)sizeValue;

// CGRect
- (id)CGRectFromNSString:(NSString *)string;
- (id)JSONObjectFromCGRect:(NSValue *)rectValue;

@end