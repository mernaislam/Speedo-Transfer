//
//  AppDelegate.swift
//  Registration
//
//  Created by Malak Mohamed on 27/08/2024.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        UNUserNotificationCenter.current().delegate = self
        askNotificationPermission()
      
        IQKeyboardManager.shared.enable = true
        navBarSetup()
        checkIfUserIsLoggedIn()
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
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.switchToNotificationsScreen()
        print("switched")
    }
    
    func askNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound,
          .badge]) { granted, error in
            if granted {
                sendNotifications = true
            } else{
                sendNotifications = false
            }
        }
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
    
    func switchToNotificationsScreen() {
        guard let window = UIApplication.shared.delegate?.window else { return }
        
        let initialViewController = AnimatedTabBarController()
        
        window?.rootViewController = initialViewController
        if let homeNavigationController = initialViewController.viewControllers?[0] as? UINavigationController {
                homeNavigationController.pushViewController(NotificationVC(), animated: true)
            }

    }
    
    func checkIfUserIsLoggedIn() {
        let token = UserDefaults.standard.string(forKey: "authToken")
        if token == nil {
            switchToLoginScreen()
        } else {
            // Proceed to main app
        }
    }

}
