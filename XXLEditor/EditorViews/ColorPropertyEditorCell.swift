//
//  ColorPropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/28/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class ColorPropertyEditorCell: PropertyEditorCell {
    @IBOutlet var textField: UITextField!
    var dirty: Bool = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.text = ""
    }
    
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if dirty, let text = textField.text, let value = DescriptorSerializer.readProperty(type: .color, description: text) {
            setValueAndNotify(value)
            dirty = false
        }
    }
    @IBAction func textFieldEditingDidChange(_ textField: UITextField) {
        dirty = true
    }
    
    override func setValue(_ value: Any) {
        if let value = value as? Double {
            let fmt = property?.type == .int ? "%.0f" : "%g"
            textField.text = String(format: fmt, value)
            super.setValue(value)
        }
    }
}
