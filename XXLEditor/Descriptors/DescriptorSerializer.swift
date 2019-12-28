//
//  DescriptorSerializer.swift
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

class DescriptorSerializer {
    static func descriptorFromFile(filePath: String) -> ViewDescriptor? {
        guard let path = Bundle.main.path(forResource: filePath, ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path)
              else { return nil }
        let declaredProperties = ViewDescriptor.declaredProperties
        let descriptor = ViewDescriptor()
        for (key, value) in dict {
            if let keyPath = key as? String,
                let type = declaredProperties[keyPath]?.type,
                let description = value as? String,
                let value = Property.read(type: type, description: description)
            {
                let _ = descriptor.setProperty(keyPath, value: value)
            }
        }
        return descriptor
    }
}
