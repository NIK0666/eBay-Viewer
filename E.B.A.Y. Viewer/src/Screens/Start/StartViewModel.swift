//
//  StartViewModel.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

protocol StartViewModelProtocol: ViewModelProtocol {
    
//    var isStartActive: BehaviorRelay<Bool> { get }
//    var enterLocationTapped: PublishSubject<Void> { get }
    
}


class StartViewModel: StartViewModelProtocol {
    
//    let isStartActive = BehaviorRelay<Bool>(value: false)
//    let currentLocationTapped = PublishSubject<Void>()
    
    var router: RouterProtocol
    
    private let disposeBag = DisposeBag()
    
    init(with router: StartRouter) {
        self.router = router
        
        setupBindings()
    }
    
    func setupBindings() {
       
    }
}
