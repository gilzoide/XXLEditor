//
//  SideSplitViewController.swift
//  XXLEditor
//
//  Created by Gil on 12/24/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class SideSplitViewController: UIViewController, UIBarPositioningDelegate {
    var mainViewController: UIViewController?
    var leftViewController: UIViewController?
    var rightViewController: UIViewController?
    
    @IBOutlet var containerView: UIView!
    
    @IBInspectable var leftWidth: CGFloat = 0
    @IBInspectable var rightWidth: CGFloat = 0
    
    func set(mainViewController viewController: UIViewController, animated: Bool) {
        if let oldVc = mainViewController {
            removeChild(oldVc)
        }
        addChild(viewController, containedIn: containerView)
        mainViewController = viewController
        layoutChildren(animated: animated)
    }
    func set(leftViewController viewController: UIViewController?, animated: Bool) {
        if let oldVc = leftViewController {
            removeChild(oldVc)
        }
        if let viewController = viewController {
            addChild(viewController, containedIn: containerView, frame: CGRect(x: -leftWidth, y: 0, width: leftWidth, height: containerView.bounds.height))
        }
        leftViewController = viewController
        layoutChildren(animated: animated)
    }
    func set(rightViewController viewController: UIViewController?, animated: Bool) {
        if let oldVc = rightViewController {
            removeChild(oldVc)
        }
        if let viewController = viewController {
            addChild(viewController, containedIn: containerView, frame: CGRect(x: containerView.bounds.width, y: 0, width: rightWidth, height: containerView.bounds.height))
        }
        rightViewController = viewController
        layoutChildren(animated: animated)
    }
    func layoutChildren(animated: Bool) {
        var rect = self.containerView.bounds
        
        UIView.animate(withDuration: animated ? 0.25 : 0) {
            if let viewController = self.rightViewController {
                viewController.view.frame = CGRect(x: rect.width - self.rightWidth, y: 0, width: self.rightWidth, height: rect.height)
                rect = rect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.rightWidth))
            }
            if let viewController = self.leftViewController {
                viewController.view.frame = CGRect(x: 0, y: 0, width: self.leftWidth, height: rect.height)
                rect = rect.inset(by: UIEdgeInsets(top: 0, left: self.leftWidth, bottom: 0, right: 0))
            }
            if let viewController = self.mainViewController {
                viewController.view.frame = rect
            }
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    @IBAction func toggleLeft(_ sender: Any?) {
        if leftViewController == nil {
            performSegue(withIdentifier: "left", sender: sender)
            if let button = sender as? UIBarButtonItem {
                button.tintColor = UIColor.label
            }
        }
        else {
            set(leftViewController: nil, animated: sender != nil)
            if let button = sender as? UIBarButtonItem {
                button.tintColor = UIColor.link
            }
        }
    }
    @IBAction func toggleRight(_ sender: Any?) {
        if rightViewController == nil {
            performSegue(withIdentifier: "right", sender: sender)
            if let button = sender as? UIBarButtonItem {
                button.tintColor = UIColor.label
            }
        }
        else {
            set(rightViewController: nil, animated: sender != nil)
            if let button = sender as? UIBarButtonItem {
                button.tintColor = UIColor.link
            }
        }
    }
}
