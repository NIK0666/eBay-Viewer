//
//  NUTextField.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

@IBDesignable class NUTextField: UITextField {

    @IBInspectable var borderWidth: CGFloat = 1
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    @IBInspectable var icon: UIImage?
    @IBInspectable var textOffset: CGFloat = 16
    
    private let iconSize = CGSize(width: 14, height: 14)
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textOffset + (icon != nil ? iconSize.width : 0) , dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override func prepareForInterfaceBuilder() {
        styleView()
    }
    override func awakeFromNib() {
        styleView()
    }
    
    func styleView() {
        
        addSubview(iconView)
        iconView.image = icon
        iconView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: iconSize.width).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: iconSize.height).isActive = true
        iconView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
}
