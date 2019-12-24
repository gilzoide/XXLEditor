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
        value = sender.isOn
    }
    
    override func valueDidSet() {
        if let value = value as? Bool {
            switchView.setOn(value, animated: true)
        }
    }

}
