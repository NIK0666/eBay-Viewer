//
//  FilterRouter.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 06.02.2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit
import SideMenu

class FilterRouter: RouterProtocol {
    
    enum PresentationContext {
        case view
    }
    
//    enum RouteType {
//        case result(hint: SearchHintModel)
//    }
    
    weak var baseVC: UIViewController?
    
    func enqueueRoute(with context: Any?, animated: Bool, completion: ItemClosure<Bool>?) {
        
//        guard let type = context as? RouteType else {
//            assertionFailure("Route type mismatch")
//            return
//        }
//
//        guard let viewController = baseVC else {
//            assertionFailure("baseVC is not set")
//            return
//        }
//
//        switch type {
//        case .result(let hint):
//            let router = ResultRouter()
//            router.present(on: viewController, animated: true, context: ResultRouter.PresentationContext.view(hint: hint), completion: nil)
//        }
    }
    
    func present(on baseViewController: UIViewController, animated: Bool, context: Any?, completion: ItemClosure<Bool>?) {
        
        guard let presentationContext = context as? PresentationContext else {
            assertionFailure("The context type missmatch")
            return
        }

        switch presentationContext {
        case .view:
            let viewController = FilterViewController()

            let viewModel = FilterViewModel.init(with: self)
            viewController.viewModel = viewModel
            
            
            
            let menuRightNavigationController = UISideMenuNavigationController(rootViewController: viewController)
            menuRightNavigationController.menuWidth = 280
            SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
            
            SideMenuManager.default.menuAddPanGestureToPresent(toView: baseViewController.navigationController!.navigationBar)
            SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: baseViewController.navigationController!.view)
            
            SideMenuManager.default.menuFadeStatusBar = false
            

            baseViewController.present(SideMenuManager.default.menuRightNavigationController!, animated: true) { }
            //baseViewController.navigationController?.pushViewController(viewController, animated: true)
            baseVC = baseViewController
        }
    }
    
    func dismiss(animated: Bool, context: Any?, completion: ItemClosure<Bool>?) {
//        baseVC?.navigationController?.popViewController(animated: true)
    }
    
}
