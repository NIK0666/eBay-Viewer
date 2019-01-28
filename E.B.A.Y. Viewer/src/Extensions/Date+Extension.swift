//
//  Date+Extension.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 28/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation

extension Date {
    func days(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        return abs(calendar.dateComponents([.day], from: self, to: secondDate).day!)
    }
    
    func minutes(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        return abs(calendar.dateComponents([.minute], from: self, to: secondDate).minute!) % 60
    }
    
    func hours(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        return abs(calendar.dateComponents([.hour], from: self, to: secondDate).hour!)  % 24
    }
}
