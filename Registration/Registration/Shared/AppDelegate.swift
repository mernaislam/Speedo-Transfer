//
//  AppDelegate.swift
//  Registration
//
//  Created by Malak Mohamed on 27/08/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        navBarSetup()
        
        // Check if it's the first time opening the app
//        let isFirstOpen = UserDefaultsManager.shared().isFirstOpen
//        if isFirstOpen {
//            showOnBoardingScreen()
//        } else {
//            switchToRegisterScreen()
//        }

        switchToRegisterScreen()
        // Uncomment to go straight to the home screen
        // switchToHomeScreen()

        window?.makeKeyAndVisible() 
        return true
    }
    
    func navBarSetup() {
        if #available(iOS 15, *) {
            // MARK: Navigation bar appearance customization
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .regular)
            ]
            navigationBarAppearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance // For scrolling edge appearance
        }
    }
    
    func showOnBoardingScreen() {
        let storyboard = UIStoryboard(name: Storyboard.OnBoardingScreen, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.OnBoarding)
        
        // Optionally, wrap this inside a UINavigationController
        // let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = initialViewController
    }

    func switchToRegisterScreen() {
        let storyboard = UIStoryboard(name: Storyboard.Main, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.SignUp)
        
        // Embed in UINavigationController if navigation is required
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationController
    }
       
    func switchToHomeScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = AnimatedTabBarController()
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
}
