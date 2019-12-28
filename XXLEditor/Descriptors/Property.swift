//
//  Property.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

struct Property: Codable {
    public let keyPath: String
    public let type: Datatype
    
    init(keyPath: String, type: Datatype) {
        self.keyPath = keyPath
        self.type = type
    }
    
    func isValid(_ value: Any) -> Bool {
        return type.isNSValue() && value is NSValue
            || type.isString() && value is String
            || type.isColor() && value is UIColor
    }
    
    func baseName() -> String {
        if let index = keyPath.lastIndex(of: ".") {
            return String(keyPath.suffix(from: keyPath.index(after: index)))
        }
        else {
            return keyPath
        }
    }
    
    // MARK: Serialization
    static func read(type: Datatype, description: String) -> Any? {
        switch type {
        case .bool, .int, .float:
            let numberFormatter = NumberFormatter()
            return numberFormatter.number(from: description)
        case .point:
            return NSValue(cgPoint: NSCoder.cgPoint(for: description))
        case .size:
            return NSValue(cgSize: NSCoder.cgSize(for: description))
        case .rect:
            return NSValue(cgRect: NSCoder.cgRect(for: description))
        case .string:
            return description
        case .color:
            let hexa3 = try! NSRegularExpression(pattern: "#\\d{3}")
            let color = UIColor.init(fromSelectorName: description)
            return color
        default:
            return nil
        }
    }
}
