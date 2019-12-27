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
typealias DescriptorInstanceProperties = [String: Any]

private let _declaredPropertyList: DescriptorPropertyList = []
private let _declaredProperties: DescriptorProperties = [:]

class Descriptor {
    // MARK: Class Properties
    /// To be overriden as appropriate
    class var declaredPropertyList: DescriptorPropertyList {
        return _declaredPropertyList
    }
    var declaredPropertyList: DescriptorPropertyList {
        return _declaredPropertyList
    }
    /// To be overriden as appropriate
    class var declaredProperties: DescriptorProperties {
        return _declaredProperties
    }
    var declaredProperties: DescriptorProperties {
        return _declaredProperties
    }
    
    // MARK: Instance Properties
    private var _properties: DescriptorInstanceProperties = [:]
    var properties: DescriptorInstanceProperties {
        return _properties
    }
    func setProperty(_ keyPath: String, value: Any) -> Bool {
        guard let property = self.declaredProperties[keyPath] else { return false }
        let valid = property.isValid(value)
        if valid {
            _properties[keyPath] = value
        }
        return valid
    }
    func property(_ keyPath: String) -> Any? {
        return _properties[keyPath]
    }
    
    convenience init(properties: DescriptorInstanceProperties) {
        self.init()
        for (keyPath, value) in properties {
            let _ = setProperty(keyPath, value: value)
        }
    }
    
    // MARK: Hierarchy
    var indexPath: IndexPath = IndexPath()
    var children: [Descriptor] = []
    func add(child: Descriptor) {
        child.indexPath = self.indexPath.appending(children.count)
        children.append(child)
    }
}
