//
//  E_B_A_Y__ViewerTests.swift
//  E.B.A.Y. ViewerTests
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import XCTest
@testable import E_B_A_Y__Viewer

class E_B_A_Y__ViewerTests: XCTestCase {

    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSXXX"
        return df
    }()
    

    //Day tests
    func testDateDiff_Day_1() {
        guard let date1 = dateFormatter.date(from: "2019-02-02T05:45:54.000Z") else { return }
        guard let date2 = dateFormatter.date(from: "2019-02-03T05:45:54.000Z") else { return }
        XCTAssertEqual(date1.days(to: date2), 1)
        
    }
    
    func testDateDiff_Day_2() {
        guard let date1 = dateFormatter.date(from: "2019-02-02T05:45:54.000Z") else { return }
        guard let date2 = dateFormatter.date(from: "2019-02-01T05:45:54.000Z") else { return }
        XCTAssertEqual(date1.days(to: date2), 1)
        
    }
    
    //Hour tests
    func testDateDiff_Hour_1() {
        guard let date1 = dateFormatter.date(from: "2019-02-02T05:45:54.000Z") else { return }
        guard let date2 = dateFormatter.date(from: "2019-02-02T07:45:54.000Z") else { return }
        XCTAssertEqual(date1.hours(to: date2), 2)
        
    }
    
    func testDateDiff_Hour_2() {
        guard let date1 = dateFormatter.date(from: "2019-02-02T05:45:54.000Z") else { return }
        guard let date2 = dateFormatter.date(from: "2019-02-01T05:45:54.000Z") else { return }
        XCTAssertEqual(date1.hours(to: date2), 0)
        
    }
    
    //Minutes tests
    func testDateDiff_Minutes_1() {
        guard let date1 = dateFormatter.date(from: "2019-02-02T05:45:54.000Z") else { return }
        guard let date2 = dateFormatter.date(from: "2019-02-01T05:43:58.000Z") else { return }
        XCTAssertEqual(date1.minutes(to: date2), 1)
        
    }
    
    func testDateDiff_Minutes_2() {
        guard let date1 = dateFormatter.date(from: "2019-02-02T08:00:00.000Z") else { return }
        guard let date2 = dateFormatter.date(from: "2019-04-01T10:10:00.000Z") else { return }
        XCTAssertEqual(date1.minutes(to: date2), 10)
        
    }
    
    func testDateDiff_Minutes_3() {
        guard let date1 = dateFormatter.date(from: "2020-05-01T11:00:59.000Z") else { return }
        guard let date2 = dateFormatter.date(from: "2019-04-01T10:00:00.000Z") else { return }
        XCTAssertEqual(date1.minutes(to: date2), 0)
        
    }
    
    

}
