//
//  UIViewController+NavigationBar.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

extension UIViewController {
        
    func setupNavigationBar(title: String, selector: Selector) {
        // Add back arrow in screens
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: selector)
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
        
        self.navigationItem.title = title
    }
}


