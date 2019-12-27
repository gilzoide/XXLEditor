//
//  DescriptorHierarchy.swift
//  XXLEditor
//
//  Created by Gil on 12/27/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

class DescriptorHierarchy {
    var items: [IndexPath: Descriptor] = [:]
    var sortedItems: [Descriptor] = []
    func addDescriptor(_ descriptor: Descriptor, asChildOf parentDescriptor: Descriptor? = nil) {
        if let parentDescriptor = parentDescriptor {
            parentDescriptor.add(child: descriptor)
        }
        addDescriptorHierarchy(descriptor)
        sortedItems = items.values.sorted(by: { (d1, d2) -> Bool in
            return d2.indexPath > d1.indexPath
        })
    }
    
    private func addDescriptorHierarchy(_ descriptor: Descriptor) {
        items[descriptor.indexPath] = descriptor
        for child in descriptor.children {
            addDescriptorHierarchy(child)
        }
    }
    
    convenience init(descriptor: Descriptor) {
        self.init()
        addDescriptor(descriptor)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(_ index: Int) -> Descriptor {
        return sortedItems[index]
    }
}
