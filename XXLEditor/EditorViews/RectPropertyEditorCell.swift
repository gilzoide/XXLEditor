//
//  RectPropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/24/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class RectPropertyEditorCell: PropertyEditorCell {
    @IBOutlet var xTextField: UITextField!
    @IBOutlet var yTextField: UITextField!
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if let _ = textField.text {
            self.value = getRect()
        }
    }
    
    override func valueDidSet() {
        if let value = value as? CGRect {
            xTextField.text = String(Int(value.origin.x))
            yTextField.text = String(Int(value.origin.y))
            widthTextField.text = String(Int(value.size.width))
            heightTextField.text = String(Int(value.size.height))
        }
    }
    
    func getRect() -> CGRect {
        let x = Int(xTextField.text ?? "") ?? 0
        let y = Int(yTextField.text ?? "") ?? 0
        let width = Int(widthTextField.text ?? "") ?? 100
        let height = Int(heightTextField.text ?? "") ?? 100
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
