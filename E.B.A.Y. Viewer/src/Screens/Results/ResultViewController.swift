//
//  ResultViewController.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 05.02.2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ResultViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tabBar: UITabBar!
    
    private let disposeBag = DisposeBag()
    var viewModel: ResultViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = nil
        tableView.register(ResultCell.nib, forCellReuseIdentifier: ResultCell.name)
        setupNavigationBar()
        setupBindings()
        
        tableView.delegate = self
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action:/* #selector(showFilter)*/ nil)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupBindings() {
        
        
        viewModel.results.asObservable().bind(to:tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.name) as! ResultCell
            cell.item = element
            return cell
            
            }.disposed(by: disposeBag)
        
        tabBar.rx.didSelectItem.asObservable().subscribe({[weak self] item in
            guard let `self` = self else {
                return
            }
            self.viewModel.filterSelected.onNext(item.element!.tag)
            }).disposed(by: disposeBag)
        
        viewModel.title.asObservable().subscribe({[weak self] title in
            self?.title = title.element!.capitalizingFirstLetter()
        }).disposed(by: disposeBag)
        
        navigationItem.rightBarButtonItem?.rx.tap.bind(to: viewModel.filterButtonTapped).disposed(by: disposeBag)
        
    }
    
    @objc func showFilter() {
        //present(, animated: true, completion: nil)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Decorator.decorate(self)
    }
}

extension ResultViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
     }
}

extension ResultViewController {
    fileprivate class Decorator {
        private init() {}
        
        static func decorate(_ vc: ResultViewController) {
            vc.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            vc.tabBar.selectedItem = vc.tabBar.items![0]
        }
    }
}
