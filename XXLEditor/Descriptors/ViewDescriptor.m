//
//  ViewDescriptor.m
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

#import "ViewDescriptor.h"

#import "Datatype.h"

static NSDictionary *_declaredProperties;


@implementation ViewDescriptor {
    NSMutableDictionary *_properties;
}

#pragma mark - Class methods
+ (void)initialize {
    if (self == ViewDescriptor.class) {
        _declaredProperties = @{
            @"tag": @(DatatypeInt),
            @"frame": @(DatatypeRect),
            @"backgroundColor": @(DatatypeColor),
            @"layer.cornerRadius": @(DatatypeFloat),
        };
    }
}

+ (NSDictionary *)declaredProperties {
    return _declaredProperties;
}


#pragma mark - Properties
- (instancetype)init {
    if (self = [super init]) {
        _properties = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (nonnull NSDictionary *)properties {
    return _properties;
}

- (BOOL)setProperty:(NSString *)keyPath value:(id)value {
    NSNumber *typeForKeyPath = [_declaredProperties objectForKey:keyPath];
    if (!typeForKeyPath) return NO;
    Datatype type = [typeForKeyPath intValue];
    if ((DatatypeIsNSValue(type) && [value isKindOfClass:NSValue.class])
        || (DatatypeIsNSString(type) && [value isKindOfClass:NSString.class])
        || (DatatypeIsUIColor(type) && [value isKindOfClass:UIColor.class])) {
        [_properties setObject:value forKey:keyPath];
        return YES;
    }
    return NO;
}

- (UIView *)instantiate {
    UIView *view = [[UIView alloc] init];
    
    for (NSString *keyPath in _properties) {
        [view setValue:[_properties objectForKey:keyPath] forKeyPath:keyPath];
    }
    
    return view;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass(self.class), self, _properties];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass(self.class), self, _properties];
}

@end
