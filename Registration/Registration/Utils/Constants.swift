//
//  Constants.swift
//  Registration
//
//  Created by Merna Islam on 29/08/2024.
//

import Foundation
import UIKit

struct ViewControllersID {
    static let SignUp = "SignUpVC1"
    static let OnBoarding = "OnBoardingVC"
    static let SignIn = "SignInVC"
}

struct Storyboard {
    static let Main = "Main"
    static let OnBoardingScreen = "OnBoardingScreen"
}

let moreItems = [
    MoreItem(prefixIcon: UIImage(named: "Website"), title: "Transfer From Website", action: {}),
    MoreItem(prefixIcon: UIImage(named: "Favorite"), title: "Favourites", action: {}),
    MoreItem(prefixIcon: UIImage(named: "Person"), title: "Profile", action: {}),
    MoreItem(prefixIcon: UIImage(named: "Help"), title: "Help", action: {}),
    MoreItem(prefixIcon: UIImage(named: "Logout"), title: "Logout", action: {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.switchToLoginScreen()
    })
]
