//
//  StartViewController.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class StartViewController: UIViewController, MVVMViewController {

    private let disposeBag = DisposeBag()
    var viewModel: StartViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Decorator.decorate(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension StartViewController {
    fileprivate class Decorator {
        private init() {}
        
        static func decorate(_ vc: StartViewController) {
            vc.navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
}
