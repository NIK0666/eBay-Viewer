//
//  StartRouter.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

final class StartRouter: RouterProtocol {
    
    weak var baseVC: UIViewController?
    
    func enqueueRoute(with context: Any?, animated: Bool, completion: ItemClosure<Bool>?) {        
        
    }
    
    func present(on baseViewController: UIViewController, animated: Bool, context: Any?, completion: ItemClosure<Bool>?) { }
    
    func dismiss(animated: Bool, context: Any?, completion: ItemClosure<Bool>?) { }
    
}
