#import <UIKit/UIKit.h>
#import "JSONValueTransformer+CGStructs.h"

@implementation JSONValueTransformer (CGStructs)

// CGPoint
- (id)CGPointFromNSString:(NSString *)string {
    return [NSValue valueWithCGPoint:CGPointFromString(string)];
}
- (id)JSONObjectFromCGPoint:(NSValue *)pointValue {
    return NSStringFromCGPoint([pointValue CGPointValue]);
}

// CGSize
- (id)CGSizeFromNSString:(NSString *)string {
    return [NSValue valueWithCGSize:CGSizeFromString(string)];
}
- (id)JSONObjectFromCGSize:(NSValue *)sizeValue {
    return NSStringFromCGSize([sizeValue CGSizeValue]);
}

// CGRect
- (id)CGRectFromNSString:(NSString *)string {
    return [NSValue valueWithCGRect:CGRectFromString(string)];
}
- (id)JSONObjectFromCGRect:(NSValue *)rectValue {
    return NSStringFromCGRect([rectValue CGRectValue]);
}

@end
