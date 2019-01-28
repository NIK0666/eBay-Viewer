//
//  SearchCell.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import Foundation

class SearchCell: UITableViewCell, NibLoadable {
    
    @IBOutlet private weak var contentLabel: UILabel!
    
    private let postfixAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 18)!, NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)] as [NSAttributedString.Key : Any]
    
    var searchHint: SearchHintModel! {
        didSet {
            
            let preparedString = NSMutableAttributedString(string: searchHint.title)
            
            var r: NSRange!
            if let range = preparedString.string.range(of: searchHint.prefix) {
                r = NSMakeRange(range.upperBound.encodedOffset, preparedString.string.count - range.upperBound.encodedOffset)
            } else {
                r = NSMakeRange(0, preparedString.string.count)
            }
            preparedString.addAttributes(postfixAttributes, range: r)
            
            DispatchQueue.main.async {
                self.contentLabel.attributedText = preparedString
            }
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
