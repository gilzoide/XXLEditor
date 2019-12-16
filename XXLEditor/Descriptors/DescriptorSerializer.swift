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
        let declaredProperties = ViewDescriptor.declaredProperties()
        let descriptor = ViewDescriptor()
        for (key, value) in dict {
            if let keyPath = key as? String,
                let typeInt = declaredProperties[keyPath] as? UInt,
                let type = Datatype(rawValue: typeInt),
                let description = value as? String,
                let value = readProperty(type: type, description: description)
            {
                descriptor.setProperty(keyPath, value: value)
            }
        }
        return descriptor
    }
    
    static func readProperty(type: Datatype, description: String) -> Any? {
        switch type {
        case .DatatypeBool, .DatatypeInt, .DatatypeFloat:
            let numberFormatter = NumberFormatter()
            return numberFormatter.number(from: description)
        case .DatatypePoint:
            return NSValue(cgPoint: NSCoder.cgPoint(for: description))
        case .DatatypeSize:
            return NSValue(cgSize: NSCoder.cgSize(for: description))
        case .DatatypeRect:
            return NSValue(cgRect: NSCoder.cgRect(for: description))
        case .DatatypeString:
            return description
        case .DatatypeColor:
            let color = UIColor.init(fromSelectorName: description)
            return color
        default:
            return nil
        }
    }
}
