//
//  NumericPropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/23/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class NumericPropertyEditorCell: PropertyEditorCell {
    @IBOutlet var textField: UITextField!
    @IBOutlet var stepper: UIStepper!
    var dirty: Bool = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.text = ""
    }
    
    @IBAction func stepperValueChanged(_ stepper: UIStepper) {
        setValueAndNotify(stepper.value)
    }
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if dirty, let text = textField.text, let value = Double(text) {
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
            stepper.value = value
            super.setValue(value)
        }
    }
}
