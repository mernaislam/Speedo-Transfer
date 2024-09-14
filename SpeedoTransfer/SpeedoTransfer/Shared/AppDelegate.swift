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
    var inactivityManager = InactivityManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initializeApp()
        
        return true
    }
    
    private func initializeApp(){
        window = UIWindow(frame: UIScreen.main.bounds)
        UNUserNotificationCenter.current().delegate = self
        askNotificationPermission()
      
        IQKeyboardManager.shared.enable = true
        navBarSetup()
        

        let isFirstOpen = UserDefaultsManager.shared().isFirstOpen
        
        if isFirstOpen {
            self.showOnBoardingScreen()
        } else {
            self.checkIfUserIsLoggedIn()
        }
        
        window?.makeKeyAndVisible()
    }
    
    func navBarSetup() {
        if #available(iOS 15, *) {
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

}

// MARK: - Navigation Extension
extension AppDelegate {
    func switchToStoryboardScreen(storyboardName: String, identifier: String){
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: identifier)
        window?.rootViewController = initialViewController
    }
    
    func showOnBoardingScreen() {
        self.switchToStoryboardScreen(storyboardName: Storyboard.OnBoardingScreen, identifier: ViewControllersID.OnBoarding)
    }

    func switchToRegisterScreen() {
        self.switchToStoryboardScreen(storyboardName: Storyboard.Main, identifier: ViewControllersID.SignUp)
    }
       
    func switchToLoginScreen() {
        self.switchToStoryboardScreen(storyboardName: Storyboard.Main, identifier: ViewControllersID.SignIn)
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
        if UserDefaultsManager.shared().isLoggedIn {
            switchToHomeScreen()
        } else {
            switchToLoginScreen()
        }
    }
}

// MARK: - Notifications Extension
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.switchToNotificationsScreen()
    }
    
    func askNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound,
          .badge]) { granted, error in
            if granted {
                canSendNotifications = true
            }
        }
    }
}


// MARK: - Timeout Extension
extension AppDelegate {
    func applicationDidBecomeActive(_ application: UIApplication) {
        inactivityManager.startInactivityTimer()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        inactivityManager.timer?.invalidate()
    }
    
    func switchToTimeOutScreen(){
        guard let window = UIApplication.shared.delegate?.window else { return }
        let initialViewController = TimeOutVC()
        initialViewController.showAlert(title: "Session Timeout", message: "You have been inactive for 2 minutes.\n Please sign in again.")
        window?.rootViewController = initialViewController
    }
}
