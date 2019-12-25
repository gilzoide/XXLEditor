//
//  EditorViewController.swift
//  XXLEditor
//
//  Created by Gil on 12/23/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class EditorViewController: SideSplitViewController {
    @IBInspectable var filePath: String? {
        didSet {
            refreshDescriptor()
        }
    }
    var descriptor: ViewDescriptor?
    
    var hierarchy: HierarchyTableViewController? {
        return leftViewController as? HierarchyTableViewController
    }
    var visualizer: VisualizerViewController? {
        return mainViewController as? VisualizerViewController
    }
    var inspector: InspectorViewController? {
        return rightViewController as? InspectorViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        performSegue(withIdentifier: "initial", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshDescriptor()
    }
    
    private func refreshDescriptor() {
        if let filePath = filePath, let descriptor = DescriptorSerializer.descriptorFromFile(filePath: filePath) {
            self.descriptor = descriptor
            visualizer?.descriptor = descriptor
            hierarchy?.descriptor = descriptor
            inspector?.descriptor = descriptor
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let viewController = segue.destination as? HierarchyTableViewController {
            viewController.descriptor = descriptor
        }
        if let viewController = segue.destination as? InspectorViewController {
            viewController.descriptor = descriptor
        }
    }
}
