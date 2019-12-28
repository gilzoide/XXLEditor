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
    var dirty: Bool = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        xTextField.text = ""
        yTextField.text = ""
    }
    
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if dirty, let _ = textField.text {
            setValueAndNotify(getPoint())
            dirty = false
        }
    }
    @IBAction func textFieldEditingDidChange(_ textField: UITextField) {
        dirty = true
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
