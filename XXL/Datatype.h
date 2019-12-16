//
//  Datatype.h
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, Datatype) {
    // simple scalars
    DatatypeBool,
    DatatypeInt,
    DatatypeFloat,
    // composite scalars
    DatatypePoint,
    DatatypeSize,
    DatatypeRect,
    DatatypeTransform,
    // objects
    DatatypeString,
    DatatypeColor,
    
    DataTypeNSValueStart = DatatypeBool,
    DataTypeNSValueEnd = DatatypeTransform,
};

static inline BOOL DatatypeIsNSValue(Datatype type) {
    return type >= DataTypeNSValueStart && type <= DataTypeNSValueEnd;
}
static inline BOOL DatatypeIsNSString(Datatype type) {
    return type == DatatypeString;
}
static inline BOOL DatatypeIsUIColor(Datatype type) {
    return type == DatatypeColor;
}
