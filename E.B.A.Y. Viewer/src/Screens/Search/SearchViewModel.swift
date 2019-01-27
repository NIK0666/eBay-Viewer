//
//  SearchViewModel.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchViewModelProtocol: ViewModelProtocol {
    var results: BehaviorRelay<[SearchHintModel]> { get }
    var searchIndexSelected: PublishSubject<Int> { get }
    
}


class SearchViewModel: SearchViewModelProtocol {
    
    let results = BehaviorRelay<[SearchHintModel]>(value: [
        SearchHintModel(title: "huawei p20 pro", prefix: "hua", category: "In Cell Phones & Smartphones"),
        SearchHintModel(title: "huawei p20 pro", prefix: "hua", category: "In Cell Phone Accessories"),
        SearchHintModel(title: "hugo boss", prefix: "hua", category: nil),
        SearchHintModel(title: "hunting", prefix: "hua", category: nil),
        SearchHintModel(title: "huawei p20 lite case", prefix: "hua", category: nil)
        ])
    
    let searchIndexSelected = PublishSubject<Int>()
   
    var router: RouterProtocol
    
    private let disposeBag = DisposeBag()
    
    init(with router: RouterProtocol) {
        self.router = router
        
        setupBindings()
    }
    
    func setupBindings() {
        
        searchIndexSelected.subscribe({ [weak self] index in
            if let item = self?.results.value[index.element!] {
                self?.router.enqueueRoute(with: SearchRouter.RouteType.result(hint: item), animated: true, completion: nil)
            }
        }).disposed(by: disposeBag)
    }
}
