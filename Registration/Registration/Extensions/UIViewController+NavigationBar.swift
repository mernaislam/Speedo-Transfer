//
//  UIViewController+NavigationBar.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

extension UIViewController {
        
    func setupNavigationBar(title: String, selector: Selector?) {
        self.navigationItem.title = title
        self.setUpNavigationBorder()
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: selector)
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func setUpNavigationBorder(){
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.shadowColor = .clear
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            // For iOS 12 and below
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.backgroundColor = .clear
        }
    }
}


