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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func textFieldEditingEnd(_ textField: UITextField) {
        if let text = textField.text {
            value = text
        }
    }
    
    override func valueDidSet() {
        if let value = value as? String {
            textField.text = value
        }
    }
}
