//
//  PropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/18/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

protocol PropertyEditorCellDelegate {
    func propertyEditorChangedValue(_ editor: PropertyEditorCell)
}

class PropertyEditorCell: UITableViewCell {
    var property: Property? {
        didSet {
            titleLabel?.text = property?.baseName()
        }
    }
    @IBOutlet var titleLabel: UILabel?
    
    var value: Any = 0 {
        didSet {
            valueDidSet()
            delegate?.propertyEditorChangedValue(self)
        }
    }
    func valueDidSet() {}
    
    var delegate: PropertyEditorCellDelegate?
}
