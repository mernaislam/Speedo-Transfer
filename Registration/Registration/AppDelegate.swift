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
        let isFirstOpen = UserDefaultsManager.shared().isFirstOpen
        
        if isFirstOpen {
            showOnBoardingScreen()
        } else {
            switchToRegisterScreen()
        }
        
        return true

    }
    
    func showOnBoardingScreen(){
        let storyboard = UIStoryboard(name: Storyboard.OnBoardingScreen, bundle: nil)

        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.OnBoarding)

        self.window?.rootViewController = initialViewController
        setBackgroundColorWhiteToRed()
    }
    
    func setBackgroundColorWhiteToRed(){
        if let rootView = self.window?.rootViewController?.view {
            let backgroundLayer = AppColors.gradientLayer
            backgroundLayer.frame = rootView.bounds
            rootView.layer.insertSublayer(backgroundLayer, at: 0)
        }
    }
    
    func switchToRegisterScreen(){
        let storyboard = UIStoryboard(name: Storyboard.Main, bundle: nil)

        let initialViewController = storyboard.instantiateViewController(withIdentifier: ViewControllersID.Register)

        self.window?.rootViewController = initialViewController
        setBackgroundColorWhiteToRed()
    }
}

