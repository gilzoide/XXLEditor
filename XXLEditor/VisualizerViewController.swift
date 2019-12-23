//
//  VisualizerViewController.swift
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class VisualizerViewController: UIViewController {
    var descriptor: ViewDescriptor? {
        didSet {
            loadViewIfNeeded()
            visualizer.descriptor = descriptor
        }
    }
    
    private weak var visualizer: VisualizerView!
    
    override func loadView() {
        let view = VisualizerView()
        visualizer = view
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
