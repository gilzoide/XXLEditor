//
//  SizePropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/27/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

class SizePropertyEditorCell: PropertyEditorCell {
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    var dirty: Bool = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        widthTextField.text = ""
        heightTextField.text = ""
    }
    
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if dirty, let _ = textField.text {
            setValueAndNotify(getSize())
            dirty = false
        }
    }
    @IBAction func textFieldEditingDidChange(_ textField: UITextField) {
        dirty = true
    }
    
    override func setValue(_ value: Any) {
        if let value = value as? CGSize {
            widthTextField.text = String(Int(value.width))
            heightTextField.text = String(Int(value.height))
            super.setValue(value)
        }
    }
    
    func getSize() -> CGSize {
        let width = Int(widthTextField.text ?? "") ?? 0
        let height = Int(heightTextField.text ?? "") ?? 0
        return CGSize(width: width, height: height)
    }
}

