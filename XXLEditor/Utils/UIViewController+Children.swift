//
//  UIViewController+Children.swift
//  XXLEditor
//
//  Created by Gil on 12/24/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import Foundation

extension UIViewController {
    func addChild(_ childController: UIViewController, containedIn view: UIView, frame: CGRect? = nil) {
        addChild(childController)
        childController.view.frame = frame ?? view.bounds
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    func removeChild(_ childController: UIViewController) {
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
}
