//
//  ViewDescriptor.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

private let _declaredPropertyList: DeclaredPropertyList = [
    Property(keyPath: "accessibilityIdentifier", type: Datatype.string),
    Property(keyPath: "tag", type: Datatype.int),
    Property(keyPath: "frame", type: Datatype.rect),
    Property(keyPath: "backgroundColor", type: Datatype.color),
    Property(keyPath: "hidden", type: Datatype.bool),
    Property(keyPath: "layer.cornerRadius", type: Datatype.float),
]
private let _declaredProperties: DeclaredProperties = {
    return _declaredPropertyList.reduce(into: [:]) { (dict, p) in
        dict[p.keyPath] = p
    }
}()

class ViewDescriptor : Descriptor {
    override class var declaredPropertyList: DeclaredPropertyList {
        return _declaredPropertyList
    }
    override class var declaredProperties: DeclaredProperties {
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
    
    private var _view: UIView?
    var view: UIView {
        loadViewIfNeeded()
        return _view!
    }
    
    var viewIfLoaded: UIView? {
        return _view
    }
    
    func loadViewIfNeeded() {
        if (_view == nil) {
            _view = UIView()
            for (keyPath, value) in properties {
                _view!.setValue(value, forKeyPath: keyPath)
            }
        }
    }
}
