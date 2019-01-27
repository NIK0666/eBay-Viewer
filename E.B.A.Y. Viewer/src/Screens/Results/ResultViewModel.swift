//
//  ResultViewModel.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ResultViewModelProtocol: ViewModelProtocol {
    var results: BehaviorRelay<[String]> { get }
}


class ResultViewModel: ResultViewModelProtocol {
    
    let results = BehaviorRelay<[String]>(value: ["", "", "", "", "", "", ""])
    
    var router: RouterProtocol
    var hint: SearchHintModel
    
    private let disposeBag = DisposeBag()
    
    init(with router: RouterProtocol, searchBy hint: SearchHintModel) {
        self.router = router
        self.hint = hint
        
        setupBindings()
    }
    
    func setupBindings() {
        
    }
}
