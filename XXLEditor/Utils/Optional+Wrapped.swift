//
//  Optional+Wrapped.swift
//  XXLEditor
//
//  Created by Gil on 12/23/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

protocol WrappedProtocol {
    func wrappedType() -> Any.Type
}

extension Optional: WrappedProtocol {
    func wrappedType() -> Any.Type {
        return Wrapped.self
    }
}
