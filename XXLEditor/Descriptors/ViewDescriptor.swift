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
    Property(keyPath: "layer.cornerRadius", type: Datatype.float),
]
private let _declaredProperties: DescriptorProperties = {
    return _declaredPropertyList.reduce(into: [:]) { (dict, p) in
        dict[p.keyPath] = p
    }
}()

class ViewDescriptor : Descriptor {
    override class var declaredPropertyList: DescriptorPropertyList {
        return _declaredPropertyList
    }
    override class var declaredProperties: DescriptorProperties {
        return _declaredProperties
    }
    
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
    
    private var _view: XXLView?
    var view: XXLView {
        loadViewIfNeeded()
        return _view!
    }
    
    var viewIfLoaded: XXLView? {
        return _view
    }
    
    func loadViewIfNeeded() {
        if (_view == nil) {
            _view = XXLView()
            for (keyPath, value) in properties {
                _view!.setValue(value, forKeyPath: keyPath)
            }
        }
    }
}
