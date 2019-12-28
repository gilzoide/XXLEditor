//
//  StringPropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/24/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class StringPropertyEditorCell: PropertyEditorCell {
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
        if dirty, let text = textField.text {
            setValueAndNotify(text)
            dirty = false
        }
    }
    @IBAction func textFieldEditingDidChange(_ textField: UITextField) {
        dirty = true
    }
    
    override func setValue(_ value: Any) {
        if let value = value as? String {
            textField.text = value
            super.setValue(value)
        }
    }
}
