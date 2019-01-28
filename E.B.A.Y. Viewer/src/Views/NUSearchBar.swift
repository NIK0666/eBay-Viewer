//
//  NUSearchBar.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

class NUSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)

        let textFieldInsideSearchBar = value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        textFieldInsideSearchBar?.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        textFieldInsideSearchBar?.clipsToBounds = true
        textFieldInsideSearchBar?.layer.borderWidth = 1
        textFieldInsideSearchBar?.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        textFieldInsideSearchBar?.layer.cornerRadius = 18
        
        let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
        textFieldInsideSearchBarLabel?.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        let glassIconView = textFieldInsideSearchBar?.leftView as? UIImageView
        
        glassIconView?.image = #imageLiteral(resourceName: "search.pdf")
        glassIconView?.tintColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
