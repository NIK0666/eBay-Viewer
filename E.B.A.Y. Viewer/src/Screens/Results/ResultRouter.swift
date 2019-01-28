//
//  ResultRouter.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

class ResultRouter: RouterProtocol {
    
    enum PresentationContext {
        case view(hint: SearchHintModel)
    }
    
    
    weak var baseVC: UIViewController?
    
    func enqueueRoute(with context: Any?, animated: Bool, completion: ItemClosure<Bool>?) {
        
    }
    
    func present(on baseViewController: UIViewController, animated: Bool, context: Any?, completion: ItemClosure<Bool>?) {
        
        guard let presentationContext = context as? PresentationContext else {
            assertionFailure("The context type missmatch")
            return
        }
        
        switch presentationContext {
        case .view(let hint):
            let viewController = ResultViewController()
            
            let viewModel = ResultViewModel.init(with: self, searchBy: hint)
            viewController.viewModel = viewModel
            
            baseViewController.navigationController?.pushViewController(viewController, animated: true)
            baseVC = baseViewController
        }
    }
    
    func dismiss(animated: Bool, context: Any?, completion: ItemClosure<Bool>?) { }
    
}
