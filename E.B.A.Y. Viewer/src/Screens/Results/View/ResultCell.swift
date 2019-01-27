//
//  ResultCell.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 27/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell, NibLoadable {

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var conditionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
