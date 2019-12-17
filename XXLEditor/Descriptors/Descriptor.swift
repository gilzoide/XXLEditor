//
//  Descriptor.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

private let _declaredProperties: [String: Property] = [:]

class Descriptor {
    /// To be overrided as appropriate
    class var declaredProperties: [String: Property] {
        return _declaredProperties
    }
    
    private var _properties: [String: Any] = [:]
    var properties: [String: Any] {
        return _properties
    }
    func setProperty(_ keyPath: String, value: Any) -> Bool {
        guard let property = ViewDescriptor.declaredProperties[keyPath] else { return false }
        let valid = property.isValid(value)
        if valid {
            _properties[keyPath] = value
        }
        return valid
    }
}
