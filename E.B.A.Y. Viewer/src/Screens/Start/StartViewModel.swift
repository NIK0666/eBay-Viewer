//
//  StartViewModel.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol StartViewModelProtocol: ViewModelProtocol {
    
    var searchButtonTapped: PublishSubject<Void> { get }
    
}


class StartViewModel: StartViewModelProtocol {
    
    let searchButtonTapped = PublishSubject<Void>()
    
    var router: RouterProtocol
    
    private let disposeBag = DisposeBag()
    
    init(with router: StartRouter) {
        self.router = router
        
        setupBindings()
    }
    
    func setupBindings() {
       
        searchButtonTapped.asObservable().subscribe({[weak self] _ in
            self?.router.enqueueRoute(with: StartRouter.RouteType.search)
        }).disposed(by: disposeBag)
        
    }
}
