//
//  AppDelegate.swift
//  BeFoot
//
//  Created by Lukas Brasseleur on 18/12/2019.
//  Copyright © 2019 LukasYaniAless. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: HomeViewController())
        window.makeKeyAndVisible()
        self.window = window
    
        // Tab bar settings
       let homeVC = HomeViewController()
       let dayMatchVC = DayMatchViewController()
       let pronoVC = PronosticsViewController()
       
       let tabBar = UITabBarController()
       tabBar.viewControllers = [homeVC, dayMatchVC, pronoVC]
       tabBar.selectedViewController = homeVC
        
       window.rootViewController = tabBar
        
        return true
    }
}
