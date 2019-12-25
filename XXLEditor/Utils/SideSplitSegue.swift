//
//  SideSplitSegue.swift
//  XXLEditor
//
//  Created by Gil on 12/24/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class MainSideSplitSegue: UIStoryboardSegue {
    @IBInspectable var animates: Bool = true
    override func perform() {
        if let sourceViewController = source as? SideSplitViewController {
            sourceViewController.set(mainViewController: destination, animated: true)
        }
    }
}

class LeftSideSplitSegue: UIStoryboardSegue {
    override func perform() {
        if let sourceViewController = source as? SideSplitViewController {
            sourceViewController.set(leftViewController: destination, animated: true)
        }
    }
}

class RightSideSplitSegue: UIStoryboardSegue {
    override func perform() {
        if let sourceViewController = source as? SideSplitViewController {
            sourceViewController.set(rightViewController: destination, animated: true)
        }
    }
}
