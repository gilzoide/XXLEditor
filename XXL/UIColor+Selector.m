//
//  UIColor+Selector.m
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

#import "UIColor+Selector.h"

@implementation UIColor (Selector)

+ (nullable UIColor *)colorFromSelectorName:(NSString *)name {
    SEL selector = NSSelectorFromString(name);
    id obj = [UIColor respondsToSelector:selector] ? [UIColor performSelector:selector] : nil;
    return [obj isKindOfClass:UIColor.class] ? obj : nil;
}

@end
