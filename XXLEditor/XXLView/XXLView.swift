//
//  XXLView.swift
//  XXLEditor
//
//  Created by Gil on 12/27/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

@objc class XXLView: UIView {
    @objc var origin: CGPoint {
        get { return frame.origin }
        set { frame = CGRect(origin: newValue, size: frame.size) }
    }
    
    @objc var size: CGSize {
        get { return frame.size }
        set { frame = CGRect(origin: frame.origin, size: newValue) }
    }
    
    convenience init(descriptor: ViewDescriptor) {
        self.init()
        for (keyPath, value) in descriptor.properties {
            self.setValue(value, forKeyPath: keyPath)
        }
    }
    
    func addInHierarchy(descriptor: Descriptor) {
        switch descriptor {
        case let subviewDescriptor as ViewDescriptor:
            addSubview(subviewDescriptor.view)
        default:
            break
        }
    }
}
