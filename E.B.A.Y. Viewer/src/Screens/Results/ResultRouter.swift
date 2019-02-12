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
    
    enum RouteType {
        case filter
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
        case .filter:
            let router = FilterRouter()
            router.present(on: viewController, animated: true, context: FilterRouter.PresentationContext.view, completion: nil)
        }
        
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
            
//            initFilterPanel()
        }
    }
    
    func dismiss(animated: Bool, context: Any?, completion: ItemClosure<Bool>?) { }
    
    func initFilterPanel() {
        
        guard let baseViewController = baseVC, baseViewController.navigationController != nil else {
            assertionFailure("Base View Controller is not initiaqlized!")
            return
        }
        
//        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: FilterViewController())
//        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
//        
//        SideMenuManager.default.menuAddPanGestureToPresent(toView: baseViewController.navigationController!.navigationBar)
//        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: baseViewController.navigationController!.view)
//        
//        SideMenuManager.default.menuFadeStatusBar = false
    }
    
}
