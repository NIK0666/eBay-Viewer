//
//  FilterViewController.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 05.02.2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilterViewController: UITableViewController {

    
    var viewModel: FilterViewModelProtocol!
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(FilterCell.nib, forCellReuseIdentifier: FilterCell.name)
        tableView.dataSource = nil
        setupNavigationBar()
        setupBindings()
        
    }
    
    func setupNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.9215686275, green: 0.07058823529, blue: 0.1019607843, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back.pdf"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        title = "Filter"
                
    }
    
    private func setupBindings() {
        
        viewModel.elements.asObservable().bind(to:tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.name) as! FilterCell
            cell.filter = element
            return cell
            
            }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe({/* [weak self]*/ indexPath in
//            self?.viewModel.searchIndexSelected.onNext(indexPath.element!.item)
        }).disposed(by: disposeBag)
    }

//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.name) as! FilterCell
//        return cell
//    }
    
}
