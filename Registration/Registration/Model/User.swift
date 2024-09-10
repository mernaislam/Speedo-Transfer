//
//  User.swift
//  Registration
//
//  Created by Malak Mohamed on 29/08/2024.
//

import Foundation

// User model
struct User: Codable {
    var name: String
    var email: String
    var password: String
    var confirmPassword: String
    var country: String
    var dateOfBirth: String
    
    init(name: String, email: String, password: String, confirmPassword: String, country: String, dateOfBirth: Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.country = country
        self.dateOfBirth = dateFormatter.string(from: dateOfBirth)
    }
}
