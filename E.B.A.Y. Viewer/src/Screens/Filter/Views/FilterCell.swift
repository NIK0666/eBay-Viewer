//
//  FilterCell.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 05.02.2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell, NibLoadable {

    var filter: FilterModel! {
        didSet {
            captionlabel.text = filter.caption
            valueField.text = filter.values.first ?? ""
        }
    }
    
    @IBOutlet private weak var valueField: UITextField!
    @IBOutlet private weak var captionlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let thePicker = UIPickerView()
        thePicker.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        thePicker.delegate = self
        valueField.inputView = thePicker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
        if selected {
            valueField.becomeFirstResponder()
        }
        super.setSelected(false, animated: false)

    }
    
}

extension FilterCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filter.values.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filter.values[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueField.text = filter.values[row]
    }
}
