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
    
    private let sortArray = [
        "Best Match",
        "Time: ending soonest",
        "Time: newly listeds",
        "Price+Shipping: lowesy first",
        "Price+Shipping: highest first",
        "Dictsnce: nearest first"]
    
    private let conditionArray = [
        "Any",
        "New",
        "Used"
    ]
    
    
    lazy var elements = BehaviorRelay<[FilterModel]>(value: [
        FilterModel(caption: "Sort", values: sortArray),
        FilterModel(caption: "Condition", values: conditionArray)
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
