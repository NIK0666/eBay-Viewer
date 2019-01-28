//
//  ResultViewController.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ResultViewController: UITableViewController {

    private let disposeBag = DisposeBag()
    var viewModel: ResultViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = nil
        tableView.register(ResultCell.nib, forCellReuseIdentifier: ResultCell.name)
        
        setupBindings()
    }
    
    private func setupBindings() {
        
        
        viewModel.results.asObservable().bind(to:tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.name) as! ResultCell
            cell.item = element
            return cell
            
            }.disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Decorator.decorate(self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    
    
}

extension ResultViewController {
    fileprivate class Decorator {
        private init() {}
        
        static func decorate(_ vc: ResultViewController) {
            vc.navigationController?.setNavigationBarHidden(false, animated: true)
            vc.navigationController?.navigationBar.barStyle = .blackTranslucent
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
