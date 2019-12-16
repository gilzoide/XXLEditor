//
//  VisualizerView.swift
//  XXLEditor
//
//  Created by Gil on 12/15/19.
//  Copyright © 2019 gilzoide. All rights reserved.
//

import UIKit

class VisualizerView: UIView {
    var scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = UIColor.systemBackground
        
        scrollView.frame = bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(scrollView)
    }
    
    @IBInspectable var shownView: String? {
        willSet {
            scrollView.subviews.forEach { $0.removeFromSuperview() }
        }
        didSet {
            if let shownView = shownView, let descriptor = DescriptorSerializer.descriptorFromFile(filePath: shownView) {
                let view = descriptor.instantiate()
                scrollView.addSubview(view)
            }
        }
    }
}
