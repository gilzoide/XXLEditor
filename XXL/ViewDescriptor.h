//
//  ViewDescriptor.h
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewDescriptor : NSObject

#pragma mark - Class methods
+ (NSDictionary *)declaredProperties;

#pragma mark - Properties
@property (strong, nonatomic, readonly) NSDictionary *properties;

- (BOOL)setProperty:(NSString *)keyPath value:(id)value;

- (UIView *)instantiate;

@end

NS_ASSUME_NONNULL_END
