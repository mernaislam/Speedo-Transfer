//
//  TransactionDetailsVC.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

class TransactionDetailsVC: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyGradientBgYellowToRed()
        self.setupNavigationBar(title: "Successful Trasactions", selector: #selector(self.goBack))
    }
    
    // MARK: - Private Methods
    @objc private func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
}
