//
//  ViewDescriptor.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

private let _declaredPropertyList: DescriptorPropertyList = [
    Property(keyPath: "accessibilityIdentifier", type: Datatype.string),
    Property(keyPath: "tag", type: Datatype.int),
    Property(keyPath: "origin", type: Datatype.point),
    Property(keyPath: "size", type: Datatype.size),
    Property(keyPath: "backgroundColor", type: Datatype.color),
    Property(keyPath: "hidden", type: Datatype.bool),
    Property(keyPath: "clipsToBounds", type: Datatype.bool),
    Property(keyPath: "layer.cornerRadius", type: Datatype.float),
]
private let _declaredProperties: DescriptorProperties = {
    return _declaredPropertyList.reduce(into: [:]) { (dict, p) in
        dict[p.keyPath] = p
    }
}()

class ViewDescriptor : Descriptor {
    // MARK: Class Properties
    override class var declaredPropertyList: DescriptorPropertyList {
        return _declaredPropertyList
    }
    override var declaredPropertyList: DescriptorPropertyList {
        return _declaredPropertyList
    }
    override class var declaredProperties: DescriptorProperties {
        return _declaredProperties
    }
    override var declaredProperties: DescriptorProperties {
        return _declaredProperties
    }
    
    // MARK: Instance Properties
    override func setProperty(_ keyPath: String, value: Any) -> Bool {
        let valid = super.setProperty(keyPath, value: value)
        if (valid) {
            _view?.setValue(value, forKeyPath: keyPath)
        }
        return valid
    }
    
    override func property(_ keyPath: String) -> Any? {
        return super.property(keyPath) ?? _view?.value(forKeyPath: keyPath)
    }
    
    // MARK: View
    private var _view: XXLView?
    var view: XXLView {
        loadViewIfNeeded()
        return _view!
    }
    
    var viewIfLoaded: XXLView? {
        return _view
    }
    
    func loadViewIfNeeded() {
        if _view == nil {
            _view = XXLView(descriptor: self)
            for child in children {
                addInHierarchy(child)
            }
        }
    }
    
    // MARK: Hierarchy
    override func add(child: Descriptor) {
        super.add(child: child)
        addInHierarchy(child)
    }
    
    private func addInHierarchy(_ descriptor: Descriptor) {
        _view?.addInHierarchy(descriptor: descriptor)
    }
}
