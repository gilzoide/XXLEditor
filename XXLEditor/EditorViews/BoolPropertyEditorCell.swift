//
//  BoolPropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/24/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class BoolPropertyEditorCell: PropertyEditorCell {
    @IBOutlet var switchView: UISwitch!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        setValueAndNotify(sender.isOn)
    }
    
    override func setValue(_ value: Any) {
        if let value = value as? Bool {
            switchView.setOn(value, animated: true)
            super.setValue(value)
        }
    }
}
