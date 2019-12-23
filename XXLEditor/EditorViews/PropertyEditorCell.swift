//
//  PropertyEditorCell.swift
//  XXLEditor
//
//  Created by Gil on 12/18/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class PropertyEditorCell: UITableViewCell {
    var property: Property? {
        didSet {
            titleLabel?.text = property?.keyPath
        }
    }
    @IBOutlet var titleLabel: UILabel?
}
