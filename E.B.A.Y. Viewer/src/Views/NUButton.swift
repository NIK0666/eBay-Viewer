//
//  NUButton.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

@IBDesignable class NUButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 1 / UIScreen.main.scale
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
    
    override func prepareForInterfaceBuilder() {
        styleView()
    }
    
    override func awakeFromNib() {
        styleView()
    }

    func styleView() {
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        alpha = isEnabled ? 1 : 0.3
    }
    
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.3
        }
    }
    
}
