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
    var searchText: PublishSubject<String?> { get }
    var onSearch: PublishSubject<String> { get }
    
}


class SearchViewModel: SearchViewModelProtocol {
    
    let results = BehaviorRelay<[SearchHintModel]>(value: [])
    var searchText = PublishSubject<String?>()
    let searchIndexSelected = PublishSubject<Int>()
    let onSearch = PublishSubject<String>()
    
    var router: RouterProtocol
    let service = AutoSugService()
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
        
        onSearch.subscribe({[weak self] text in
            guard text.element!.count > 1 else { return }
            let item = SearchHintModel(title: text.element!, prefix: "")
            self?.router.enqueueRoute(with: SearchRouter.RouteType.result(hint: item), animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        searchText.debounce(0.3, scheduler: MainScheduler.instance)
            .subscribe({[weak self] str in
                guard str.element != nil, let keyword = str.element!, keyword.count > 1 else { return }
                
                self?.service.request(by: keyword, success: {[weak self] arr in
                    
                    print("SUCCESS")
                    
                    self?.results.accept(arr.map({ elem -> SearchHintModel in
                        return SearchHintModel(title: elem, prefix: keyword.lowercased())
                    }))
                   
                }) { error in
                    print("ERROR")
                }
                
               
            }).disposed(by: disposeBag)
    }
}
