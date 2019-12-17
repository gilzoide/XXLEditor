//
//  Property.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

struct Property {
    var keyPath: String
    var type: Datatype
    
    init(keyPath: String, type: Datatype) {
        self.keyPath = keyPath
        self.type = type
    }
    
    func isValid(_ value: Any) -> Bool {
        return type.isNSValue() && value is NSValue
            || type.isString() && value is String
            || type.isColor() && value is UIColor
    }
}
