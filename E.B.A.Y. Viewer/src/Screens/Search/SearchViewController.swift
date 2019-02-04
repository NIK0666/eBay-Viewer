//
//  SearchViewController.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UITableViewController/*, UISearchBarDelegate*/ {
    
    fileprivate var searchBar: NUSearchBar = {
        let bar = NUSearchBar()
        bar.placeholder = "Search on eBay"
        return bar
    }()
    
    
    fileprivate var cancelButton: NUButton = {
        let button = NUButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 77, height: 32)
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
        button.styleView()
        return button
    }()
    
    private let disposeBag = DisposeBag()
    var viewModel: SearchViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = nil
        
        tableView.register(SearchCell.nib, forCellReuseIdentifier: SearchCell.name)
        
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancelButton)
        setupBindings()
    }
    
    @objc private func cancelActionHandler(sender: NUButton) {
        print("!!!")
    }
    
    private func setupBindings() {

        searchBar.rx.text.bind(to: viewModel.searchText).disposed(by: disposeBag)
        
        searchBar.textFieldInsideSearchBar.rx.controlEvent(.editingDidEndOnExit).subscribe({[weak self] _ in
            self?.viewModel.onSearch.onNext(self?.searchBar.textFieldInsideSearchBar.text ?? "")
        }).disposed(by: disposeBag)
        
        cancelButton.rx.tap.bind(to: viewModel.cancelTapped).disposed(by: disposeBag)
        
        
        viewModel.results.asObservable().bind(to:tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.name) as! SearchCell
            cell.searchHint = element
            return cell
            
            }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe({ [weak self] indexPath in
            self?.viewModel.searchIndexSelected.onNext(indexPath.element!.item)
        }).disposed(by: disposeBag)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Decorator.decorate(self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    

    
}

extension SearchViewController {
    fileprivate class Decorator {
        private init() {}
        
        static func decorate(_ vc: SearchViewController) {
            vc.navigationController?.setNavigationBarHidden(false, animated: true)
            vc.navigationItem.setHidesBackButton(true, animated: false)
        }
    }
}
