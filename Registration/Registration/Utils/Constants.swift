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
    MoreItem(prefixImage: UIImage(named: "Website"), title: "Transfer From Website"),
    MoreItem(prefixImage: UIImage(named: "Favorite"), title: "Favourites"),
    MoreItem(prefixImage: UIImage(named: "Person"), title: "Profile"),
    MoreItem(prefixImage: UIImage(named: "Help"), title: "Help"),
    MoreItem(prefixImage: UIImage(named: "Logout"), title: "Logout")
]

let onBoardingSlides = [
    OnBoardingModel(title: "Amount", description: "Send money fast with simple steps. Create account, Confirmation, Payment. Simple.", image: UIImage(imageLiteralResourceName: "Amount")),
    
    OnBoardingModel(title: "Confirmation", description: "Transfer funds instantly to friends and family worldwide, strong shield protecting a money.", image: UIImage(imageLiteralResourceName: "Confirmation")),
    
    OnBoardingModel(title: "Payment", description: "Enjoy peace of mind with our secure platform  Transfer funds instantly to friends.", image: UIImage(imageLiteralResourceName: "Payment"))
]

let profileItems = [
    ProfileItem(prefixImage: UIImage(named: "Profile Information"), title: "Personal Information", subTitle: "Your information"),
    ProfileItem(prefixImage: UIImage(named: "Settings"), title: "Settings", subTitle: "Change your settings"),
    ProfileItem(prefixImage: UIImage(named: "Payment History"), title: "Payment History", subTitle: "view your transactions"),
    ProfileItem(prefixImage: UIImage(named: "Favorite List"), title: "My Favorite list", subTitle: "view your favorites")
]
