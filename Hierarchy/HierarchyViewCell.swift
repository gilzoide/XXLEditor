//
//  HierarchyViewCell.swift
//  XXLEditor
//
//  Created by Gil on 12/27/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class HierarchyViewCell: UITableViewCell {
    var descriptor: ViewDescriptor? {
        didSet {
            let indexPath = descriptor?.indexPath
            indentationLevel = indexPath?.count ?? 0
            textLabel?.text = descriptor?.viewIfLoaded?.accessibilityIdentifier ?? "View \(indexPath?.last ?? -1)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
