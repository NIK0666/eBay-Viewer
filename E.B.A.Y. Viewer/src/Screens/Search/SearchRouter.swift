//
//  SearchRouter.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 26/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

class SearchRouter: RouterProtocol {
    
    enum PresentationContext {
        case view
    }
    
    enum RouteType {
        case result(hint: SearchHintModel)
    }
    
    weak var baseVC: UIViewController?
    
    func enqueueRoute(with context: Any?, animated: Bool, completion: ItemClosure<Bool>?) {
        guard let type = context as? RouteType else {
            assertionFailure("Route type mismatch")
            return
        }
        
        guard let viewController = baseVC else {
            assertionFailure("baseVC is not set")
            return
        }
        
        switch type {
        case .result(let hint):
            let router = ResultRouter()
            router.present(on: viewController, animated: true, context: ResultRouter.PresentationContext.view(hint: hint), completion: nil)
        }
    }
    
    func present(on baseViewController: UIViewController, animated: Bool, context: Any?, completion: ItemClosure<Bool>?) {
        guard let presentationContext = context as? PresentationContext else {
            assertionFailure("The context type missmatch")
            return
        }
        
        switch presentationContext {
        case .view:
            let viewController = SearchViewController()
            
            let viewModel = SearchViewModel.init(with: self)
            viewController.viewModel = viewModel
            
            baseViewController.navigationController?.pushViewController(viewController, animated: true)
            baseVC = baseViewController
        }
    }
    
    func dismiss(animated: Bool, context: Any?, completion: ItemClosure<Bool>?) { }
    
}
