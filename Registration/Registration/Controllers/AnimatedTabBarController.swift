///
///  AnimatedTabBarController.swift
///  Registration
///
///  Created by Merna Islam on 03/09/2024.
///
import RAMAnimatedTabBarController
import UIKit

class AnimatedTabBarController: RAMAnimatedTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    
    private func configure() {
        let homeVc = UINavigationController(rootViewController: HomeVC())
        let v2 = UIViewController()
        let homeVc2 = HomeVC()
        let v3 = UIViewController()
        let homeVc3 = HomeVC()
        
        v2.view.backgroundColor = .systemRed
        v3.view.backgroundColor = .systemBlue
        
        // Home Tab
        homeVc.tabBarItem = customAnimatedTabBar(title: "Home", image: UIImage(named: "Home"), tag: 0, animation: RAMBounceAnimation())
        
        // Transfer Tab
        v2.tabBarItem = customAnimatedTabBar(title: "Transfer", image: UIImage(named: "Transfer"), tag: 1, animation: RAMRotationAnimation())
        
        // Transactions Tab
        homeVc2.tabBarItem = customAnimatedTabBar(title: "Transactions", image: UIImage(named: "Transactions"), tag: 2, animation: RAMBounceAnimation())
        
        // My Cards Tab
        v3.tabBarItem = customAnimatedTabBar(title: "My Cards", image: UIImage(named: "My Cards"), tag: 3, animation: RAMRightRotationAnimation())
        
        // More Tab
        homeVc3.tabBarItem = customAnimatedTabBar(title: "More", image: UIImage(named: "More"), tag: 4, animation: RAMBounceAnimation())
        
        // Tab Bar Appearance
        self.tabBar.tintColor = AppColors.primaryColor
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.backgroundColor = UIColor.white.cgColor
        
        setViewControllers([homeVc, v2, homeVc2, v3, homeVc3], animated: false)
    }
    
    private func customAnimatedTabBar(title: String, image: UIImage?, tag: Int, animation: RAMItemAnimation) -> UITabBarItem{
        let item = RAMAnimatedTabBarItem(title: title, image: image, tag: tag)
        animation.textSelectedColor = AppColors.primaryColor
        item.animation = animation
        
        // Adjust the text size
        item.textFontSize = 12
        item.textColor = .darkGray
        item.iconColor = .darkGray
                        
        return item
    }
}
