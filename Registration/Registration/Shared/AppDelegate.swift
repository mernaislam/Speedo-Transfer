//
//  AppDelegate.swift
//  Registration
//
//  Created by Malak Mohamed on 27/08/2024.
//

import UIKit
//import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        IQKeyboardManager.shared.enable = true
        navBarSetup()
        
        // Check if it's the first time opening the app
//        let isFirstOpen = UserDefaultsManager.shared().isFirstOpen
//        if isFirstOpen {
//            showOnBoardingScreen()
//        } else {
//            switchToRegisterScreen()
//        }

//        switchToRegisterScreen()
//        showOnBoardingScreen()
         switchToHomeScreen()

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
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .light)
            ]
            navigationBarAppearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    func showOnBoardingScreen() {
        let storyboard = UIStoryboard(name: Storyboard.OnBoardingScreen, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.OnBoarding)
        window?.rootViewController = initialViewController
    }

    func switchToRegisterScreen() {
        let storyboard = UIStoryboard(name: Storyboard.Main, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.SignUp)
        
        // Embed in UINavigationController if navigation is required
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationController
    }
       
    func switchToLoginScreen() {
        let storyboard = UIStoryboard(name: Storyboard.Main, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.SignIn)
        
        // Embed in UINavigationController if navigation is required
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationController
    }
    
    func switchToHomeScreen() {
        guard let window = UIApplication.shared.delegate?.window else { return }
        
        let initialViewController = AnimatedTabBarController()
        
        UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            window?.rootViewController = initialViewController
        }, completion: nil)
    }
}
