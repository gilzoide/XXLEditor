//
//  Array+Safe.swift
//  XXLEditor
//
//  Created by Gil on 12/23/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
