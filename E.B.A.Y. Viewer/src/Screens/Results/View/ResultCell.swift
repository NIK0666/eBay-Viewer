//
//  ResultCell.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 27/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell, NibLoadable {

    @IBOutlet private weak var previewView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var conditionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var betsLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    var item: FindingResultItem! {
        didSet {
            descriptionLabel.text = item.title.first ?? ""
            
            conditionLabel.text = item.condition?.first?.conditionDisplayName.first ?? ""

            if let price = item.sellingStatus.first?.currentPrice.first {
                priceLabel.text = "\(price.value) \(price.currencyID)"
            } else {
                priceLabel.text = "Free"
            }
            if let bets = item.sellingStatus.first?.bidCount?.first {
                betsLabel.text = "Bets: \(bets)"
            } else {
                betsLabel.text = "Buy now"
            }
            
            if let dateString = item.listingInfo.first?.endTime.first {
                timeLabel.text = formatDateString(from: dateString)
            } else {
                timeLabel.text = ""
            }
            
            previewView.image = nil
            if let url = item.galleryURL?.first {
                previewView.setImage(from: url)
            }
            
            
            
            
        }
    }
    
    func formatDateString(from string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSXXX"
        guard let date = dateFormatter.date(from: string) else { return ""}

        let currentDate = Date()
        
        let days = currentDate.days(to: date)
        let hours = currentDate.hours(to: date)
        let minutes = currentDate.minutes(to: date)
        
        var outStr = ""
        
        if days > 0 {
            outStr.append("\(days)d ")
        }
        if hours > 0 {
            outStr.append("\(hours)h ")
        }
        if days == 0 && minutes > 0 {
            outStr.append("\(minutes)m")
        }
        
        return outStr
        
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
