//
//  AppDelegate.swift
//  Registration
//
//  Created by Malak Mohamed on 27/08/2024.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        navBarSetup()
//        let isFirstOpen = UserDefaultsManager.shared().isFirstOpen
//        
//        if isFirstOpen {
//            showOnBoardingScreen()
//        } else {
//            switchToRegisterScreen()
//        }
        switchToHomeScreen()
        return true

    }
    
    func navBarSetup(){
        if #available(iOS 15, *) {
            // MARK: Navigation bar appearance
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .regular)
            ]
            navigationBarAppearance.backgroundColor = UIColor.clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance

        }
    }
    
    func showOnBoardingScreen(){
        let storyboard = UIStoryboard(name: Storyboard.OnBoardingScreen, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.OnBoarding)
        self.window?.rootViewController = initialViewController
    }
    
    func switchToRegisterScreen(){
        let storyboard = UIStoryboard(name: Storyboard.Main, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.Register)
        self.window?.rootViewController = initialViewController
    }
       
    func switchToHomeScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = AnimatedTabBarController()
        self.window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
}

