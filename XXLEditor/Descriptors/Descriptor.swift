//
//  Descriptor.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

typealias DescriptorPropertyList = [Property]
typealias DescriptorProperties = [String: Property]

private let _declaredPropertyList: DescriptorPropertyList = []
private let _declaredProperties: DescriptorProperties = [:]

class Descriptor {
    /// To be overriden as appropriate
    class var declaredPropertyList: DescriptorPropertyList {
        return _declaredPropertyList
    }
    /// To be overriden as appropriate
    class var declaredProperties: DescriptorProperties {
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
    func property(_ keyPath: String) -> Any? {
        return _properties[keyPath]
    }
}
