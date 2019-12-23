//
//  IntPropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/23/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class IntPropertyEditorCell: PropertyEditorCell {
    var value: Int = 0 {
        didSet {
            textField.text = String(value)
            stepper.value = Double(value)
        }
    }
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var stepper: UIStepper!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func valueChanged(_ stepper: UIStepper) {
        value = Int(stepper.value)
    }
}
