//
//  AppDelegate.swift
//  E.B.A.Y. Viewer
//
//  Created by NIKO on 25/01/2019.
//  Copyright © 2019 NIKO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let coordinator = UICoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator.presentStartScreen(&window)
        
        //UINavigationBar.appearance().setBackgroundImage(UIImage.image(from: UIColor.black, frame: CGRect(x: 0, y: 0, width: 340, height: 64)), for: .default)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        return true
    }
    
}

