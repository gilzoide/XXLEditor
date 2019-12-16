//
//  UIColor+Selector.h
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Selector)

+ (nullable UIColor *)colorFromSelectorName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
