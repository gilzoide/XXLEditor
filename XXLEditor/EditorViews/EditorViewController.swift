//
//  EditorViewController.swift
//  XXLEditor
//
//  Created by Gil on 12/23/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class EditorViewController: UISplitViewController {
    @IBInspectable var filePath: String? {
        didSet {
            refreshDescriptor()
        }
    }
    
    var visualizer: VisualizerViewController? {
        return viewControllers[safe: 0] as? VisualizerViewController
    }
    var inspector: InspectorViewController? {
        return viewControllers[safe: 1] as? InspectorViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshDescriptor()
    }
    
    private func refreshDescriptor() {
        if let filePath = filePath, let descriptor = DescriptorSerializer.descriptorFromFile(filePath: filePath) {
            visualizer?.descriptor = descriptor
            inspector?.descriptor = descriptor
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
