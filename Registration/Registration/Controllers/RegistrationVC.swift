//
//  RegistrationVC.swift
//  Registration
//
//  Created by Merna Islam on 29/08/2024.
//

import UIKit

class RegistrationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultsManager.shared().isFirstOpen = false
    }

}
