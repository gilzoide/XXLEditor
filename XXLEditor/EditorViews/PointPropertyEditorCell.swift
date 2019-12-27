//
//  PointPropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/27/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

class PointPropertyEditorCell: PropertyEditorCell {
    @IBOutlet var xTextField: UITextField!
    @IBOutlet var yTextField: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if let _ = textField.text {
            setValueAndNotify(getPoint())
        }
    }
    
    override func setValue(_ value: Any) {
        if let value = value as? CGPoint {
            xTextField.text = String(Int(value.x))
            yTextField.text = String(Int(value.y))
            super.setValue(value)
        }
    }
    
    func getPoint() -> CGPoint {
        let x = Int(xTextField.text ?? "") ?? 0
        let y = Int(yTextField.text ?? "") ?? 0
        return CGPoint(x: x, y: y)
    }
}
