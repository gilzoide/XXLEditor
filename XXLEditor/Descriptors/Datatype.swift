//
//  Datatype.swift
//  XXLEditor
//
//  Created by Gil on 12/17/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

private let NSValueStart = Datatype.bool.rawValue
private let NSValueEnd = Datatype.transform.rawValue

enum Datatype : Int, Codable {
    case bool
    case int
    case float
    
    case point
    case size
    case rect
    case transform
    
    case string
    case color
    
    func isNSValue() -> Bool {
        return rawValue >= NSValueStart && rawValue <= NSValueEnd
    }
    
    func isString() -> Bool {
        return self == .string
    }
    
    func isColor() -> Bool {
        return self == .color
    }
    
    public var editorIdentifier: String {
        return "\(self)Editor"
    }
}
