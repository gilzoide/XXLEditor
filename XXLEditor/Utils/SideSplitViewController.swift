//
//  SideSplitViewController.swift
//  XXLEditor
//
//  Created by Gil on 12/24/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class SideSplitViewController: UIViewController {
    var mainViewController: UIViewController?
    var leftViewController: UIViewController?
    var rightViewController: UIViewController?
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var mainContainerView: UIView!
    @IBOutlet var leftContainerView: UIView!
    @IBOutlet var rightContainerView: UIView!
    @IBOutlet var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet var rightBarButtonItem: UIBarButtonItem!
    
    @IBInspectable var collapsedColor: UIColor = UIColor.link
    @IBInspectable var expandedColor: UIColor = UIColor.label
    
    func set(mainViewController viewController: UIViewController, animated: Bool) {
        let oldVc = mainViewController
        addChild(viewController, containedIn: mainContainerView)
        mainViewController = viewController
        UIView.animate(withDuration: animated ? 0.25 : 0, animations: {
            self.layoutChildren()
        }) { (finished) in
            if let oldVc = oldVc {
                self.removeChild(oldVc)
            }
        }
    }
    
    func removeLeftViewController(animated: Bool) {
        if let oldVc = leftViewController {
            let offRect = leftContainerView.bounds.offsetBy(dx: -leftContainerView.bounds.width, dy: 0)
            UIView.animate(withDuration: animated ? 0.25 : 0, animations: {
                self.rightContainerView.frame = offRect
            }) { (finished) in
                self.removeChild(oldVc)
            }
        }
    }
    
    func set(leftViewController viewController: UIViewController?, animated: Bool) {
        let oldVc = leftViewController
        if let viewController = viewController {
            addChild(viewController, containedIn: leftContainerView)
            leftBarButtonItem.tintColor = expandedColor
        }
        else {
            leftBarButtonItem.tintColor = collapsedColor
        }
        leftViewController = viewController
        UIView.animate(withDuration: animated ? 0.25 : 0, animations: {
            self.layoutChildren()
        }) { (finished) in
            if let oldVc = oldVc {
                self.removeChild(oldVc)
            }
        }
    }
    func set(rightViewController viewController: UIViewController?, animated: Bool) {
        let oldVc = rightViewController
        if let viewController = viewController {
            addChild(viewController, containedIn: rightContainerView)
            rightBarButtonItem.tintColor = expandedColor
        }
        else {
            rightBarButtonItem.tintColor = collapsedColor
        }
        rightViewController = viewController
        UIView.animate(withDuration: animated ? 0.25 : 0, animations: {
            self.layoutChildren()
        }) { (finished) in
            if let oldVc = oldVc {
                self.removeChild(oldVc)
            }
        }
    }
    func layoutChildren() {
        var rect = self.containerView.bounds
        
        if let viewController = self.rightViewController {
            var frame = rightContainerView.frame
            frame.origin.x = rect.width - rightContainerView.bounds.width
            rightContainerView.frame = frame
            viewController.view.frame = rightContainerView.bounds
            rect = rect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightContainerView.bounds.width))
        }
        else {
            rightContainerView.frame = rightContainerView.bounds.offsetBy(dx: rect.width, dy: 0)
        }
        if let viewController = self.leftViewController {
            var frame = leftContainerView.frame
            frame.origin.x = 0
            leftContainerView.frame = frame
            viewController.view.frame = leftContainerView.bounds
            rect = rect.inset(by: UIEdgeInsets(top: 0, left: leftContainerView.bounds.width, bottom: 0, right: 0))
        }
        else {
            leftContainerView.frame = leftContainerView.bounds.offsetBy(dx: -leftContainerView.bounds.width, dy: 0)
        }
        
        mainContainerView.frame = rect
    }
    
    @IBAction func toggleLeft(_ sender: Any?) {
        if leftViewController == nil {
            performSegue(withIdentifier: "left", sender: sender)
        }
        else {
            set(leftViewController: nil, animated: sender != nil)
        }
    }
    @IBAction func toggleRight(_ sender: Any?) {
        if rightViewController == nil {
            performSegue(withIdentifier: "right", sender: sender)
        }
        else {
            set(rightViewController: nil, animated: sender != nil)
        }
    }
}
