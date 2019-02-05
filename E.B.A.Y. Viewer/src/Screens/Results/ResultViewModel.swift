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
}


class ResultViewModel: ResultViewModelProtocol {
    
    let results = BehaviorRelay<[FindingResultItem]>(value: [])
    
    var router: RouterProtocol
    var hint: SearchHintModel
    
    private let disposeBag = DisposeBag()
    
    let service = FindingService()

    init(with router: RouterProtocol, searchBy hint: SearchHintModel) {
        self.router = router
        self.hint = hint
        
        setupBindings()
        
        let filter = Filter(name: "ListingType", values: ["Auction","AuctionWithBIN"])
        
        service.request(by: hint.title, filters: [filter], success: {[weak self] data  in
            guard let items = data.searchResult.first?.item else { return }
            self?.results.accept(items)
        }) { error  in
            
        }
    }
    
    func setupBindings() {
        
        
        
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
