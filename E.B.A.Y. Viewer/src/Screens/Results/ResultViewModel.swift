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
    var results: BehaviorRelay<[FindingResultItem]> { get }
    var filterSelected: BehaviorSubject<Int> { get }
    var title: BehaviorRelay<String> { get }
}


class ResultViewModel: ResultViewModelProtocol {
    
    let filterSelected = BehaviorSubject<Int>(value: 0)
    let results = BehaviorRelay<[FindingResultItem]>(value: [])
    var title = BehaviorRelay<String>(value: "")
    
    var router: RouterProtocol
    var hint: SearchHintModel
    
    private let disposeBag = DisposeBag()
    
    let service = FindingService()

    init(with router: RouterProtocol, searchBy hint: SearchHintModel) {
        self.router = router
        self.hint = hint
        
        title.accept(hint.title)
        
        setupBindings()        
    }
    
    func setupBindings() {
        filterSelected.subscribe({[weak self] index in
            guard let `self` = self else {
                return
            }
            var filters = [Filter]()
            switch index.element {
            case 1:
                filters.append(Filter(name: "ListingType", values: [ListingType.auction.rawValue, ListingType.auctionWithBIN.rawValue]))
            case 2:
                filters.append(Filter(name: "ListingType", values: [ListingType.fixedPrice.rawValue,ListingType.storeInventory.rawValue]))
                
//            case fixedPrice = "FixedPrice"
//            case storeInventory = "StoreInventory"
            default: break
            }
            
            self.service.request(by: self.hint.title, filters: filters, success: {[weak self] data  in
                guard let items = data.searchResult.first?.item else { return }
                self?.results.accept(items)
            }) { error  in
                
            }
            
            
        }).disposed(by: disposeBag)
        
        
        
        //                self?.service.request(by: keyword, success: { model in
        //                    if let items = model.searchResult.first?.item {
        //                        print(items.count)
        //                    } else {
        //                        print("NOT FOUND")
        //                    }
        //                }) { error in
        //                    print("ERROR")
        //                }
    }
}
