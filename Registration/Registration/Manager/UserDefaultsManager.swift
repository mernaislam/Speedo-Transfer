//
//  UserDefaultsManager.swift
//  Registration
//
//  Created by Merna Islam on 29/08/2024.
//

import Foundation

class UserDefaultsManager {
    
    // MARK: - Singleton
    static private let sharedInstance = UserDefaultsManager()
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    // MARK: - Proprties
    private let def = UserDefaults.standard
    var isFirstOpen: Bool {
        set {
            def.setValue(newValue, forKey: "isFirstOpen")
        } get {
            if def.object(forKey: "isFirstOpen") == nil {
                return true
            }
            return false
        }
    }
    
    var isLoggedIn: Bool {
        set {
            def.setValue(newValue, forKey: "isLoggedIn")
        } get {
            if def.object(forKey: "isLoggedIn") == nil {
                return true
            }
            return false
        }
    }
    
}
