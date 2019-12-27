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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if let _ = textField.text {
            setValueAndNotify(getSize())
        }
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

