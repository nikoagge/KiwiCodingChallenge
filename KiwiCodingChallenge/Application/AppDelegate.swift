//
//  AppDelegate.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 18/6/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    public lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    public lazy var appDependency = AppDependency()
    public lazy var coordinator = HomeCoordinator(router: router, container: appDependency)
    public lazy var router = AppDelegateRouter(window: window!)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if window != nil {
            coordinator.present(animated: true, onDismissed: nil)
        }
        
        return true
    }
}
