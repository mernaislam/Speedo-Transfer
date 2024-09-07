///
///  AnimatedTabBarController.swift
///  Registration
///
///  Created by Merna Islam on 03/09/2024.
///
import RAMAnimatedTabBarController
import UIKit


class AnimatedTabBarController: RAMAnimatedTabBarController {
    
    // MARK: - Properties
    var homeNavigation: UINavigationController!
    var transferNavigation: UINavigationController!
    var transactionNavigation: UINavigationController!
    var cardNavigation: UINavigationController!
    var moreNavigation: UINavigationController!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViewControllers()
        self.setUpTabBar()
    }
}

// MARK: - Private Methods
extension AnimatedTabBarController {
    
    private func setUpTabBar(){
        self.tabBar.tintColor = AppColors.primaryColor
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.backgroundColor = UIColor.white.cgColor
        self.viewControllers = [homeNavigation, transferNavigation, transactionNavigation, cardNavigation, moreNavigation]
    }
    
    private func setUpViewControllers(){
        // Home Tab
        self.homeNavigation = UINavigationController(rootViewController: HomeVC())
        self.homeNavigation.tabBarItem = customAnimatedTabBar(title: "Home", image: UIImage(named: "Home"), tag: 0, animation: RAMBounceAnimation())
        
        // Transfer Tab
        self.transferNavigation = UINavigationController(rootViewController: UIViewController())
        self.transferNavigation.tabBarItem = customAnimatedTabBar(title: "Transfer", image: UIImage(named: "Transfer"), tag: 1, animation: RAMRotationAnimation())
        
        // Transactions Tab
        self.transactionNavigation = UINavigationController(rootViewController: TransactionsVC())
        self.transactionNavigation.tabBarItem = customAnimatedTabBar(title: "Transactions", image: UIImage(named: "Transactions"), tag: 2, animation: RAMBounceAnimation())

        // My Cards Tab
        self.cardNavigation = UINavigationController(rootViewController: UIViewController())
        self.cardNavigation.tabBarItem = customAnimatedTabBar(title: "My Cards", image: UIImage(named: "My Cards"), tag: 3, animation: RAMRightRotationAnimation())
        
        // More Tab
        self.moreNavigation = UINavigationController(rootViewController: UIViewController())
        self.moreNavigation.tabBarItem = customAnimatedTabBar(title: "More", image: UIImage(named: "More"), tag: 4, animation: RAMBounceAnimation())
    }
    
    private func customAnimatedTabBar(title: String, image: UIImage?, tag: Int, animation: RAMItemAnimation) -> RAMAnimatedTabBarItem{
        
        let item = RAMAnimatedTabBarItem(title: title, image: image, tag: tag)
        animation.textSelectedColor = AppColors.primaryColor
        
        item.animation = animation
        item.textFontSize = 12
        
        item.textColor = .darkGray
        item.iconColor = .darkGray
                        
        return item
    }
    
    private func switchToHomeTab(){
        self.navigationController?.tabBarController?.selectedIndex = 0
        self.tabBar.setNeedsLayout()
        self.tabBar.layoutIfNeeded()
    }
}
