//
//  StartRouter.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

final class StartRouter: RouterProtocol {
    
    enum RouteType {
        case search
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
        case .search:
            let router = SearchRouter()
            router.present(on: viewController, animated: true, context: SearchRouter.PresentationContext.view, completion: nil)
        }
    }
    
    func present(on baseViewController: UIViewController, animated: Bool, context: Any?, completion: ItemClosure<Bool>?) { }
    
    func dismiss(animated: Bool, context: Any?, completion: ItemClosure<Bool>?) { }
    
}
