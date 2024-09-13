//
//  TokenManager.swift
//  Registration
//
//  Created by Merna Islam on 11/09/2024.
//

class TokenManager {
    static let shared = TokenManager()
    private init() {}
    
    private var token: String?
    
    func setToken(_ newToken: String) {
        token = newToken
        KeychainManager.saveTokenToKeychain(token: newToken)
    }
    
    func getToken() -> String? {
        if token == nil {
            token = KeychainManager.getTokenFromKeychain()
        }
        return token
    }
    
    func clearToken() {
            token = nil
            KeychainManager.deleteTokenFromKeychain()
        }
}

