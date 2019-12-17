//
//  ViewDescriptor.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation


private let _declaredProperties: [String: Property] = {
    let properties = [
        Property(keyPath: "tag", type: Datatype.int),
        Property(keyPath: "frame", type: Datatype.rect),
        Property(keyPath: "backgroundColor", type: Datatype.color),
        Property(keyPath: "layer.cornerRadius", type: Datatype.float),
    ]
    
    return properties.reduce(into: [:]) { (dict, p) in
        dict[p.keyPath] = p
    }
}()

class ViewDescriptor : Descriptor {
    override class var declaredProperties: [String: Property] {
        return _declaredProperties
    }
    
    override func setProperty(_ keyPath: String, value: Any) -> Bool {
        let valid = super.setProperty(keyPath, value: value)
        if (valid) {
            _view?.setValue(value, forKeyPath: keyPath)
        }
        return valid
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
