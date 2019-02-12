//
//  FilterViewModel.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 06.02.2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol FilterViewModelProtocol {
    var elements: BehaviorRelay<[FilterModel]> { get }
}

class FilterViewModel: FilterViewModelProtocol {
    
    let elements = BehaviorRelay<[FilterModel]>(value: [
        FilterModel(caption: "Sort", values: ["Best Match","Time: ending soonest","Time: newly listeds","Price+Shipping: lowesy first","Price+Shipping: highest first","Dictsnce: nearest first"]),
        FilterModel(caption: "Condition", values: ["Any", "New", "Used"])
        ])
    var router: RouterProtocol
    private let disposeBag = DisposeBag()
    
    init(with router: RouterProtocol) {
        self.router = router
        
        setupBindings()
    }
    
    func setupBindings() {
        
    }
    
    
}
