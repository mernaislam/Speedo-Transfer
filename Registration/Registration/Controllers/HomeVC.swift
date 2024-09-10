//
//  HomeVC.swift
//  Registration
//
//  Created by Merna Islam on 02/09/2024.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var profileView: UIView!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var transactionTableView: UITableView!
    @IBOutlet var notificationIcon: UIImageView!
    
    // MARK: - Properties
    var tabSwitchDelegate: TabSwitchProtocol!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateVC()
    }

    // MARK: - Private Methods
    private func initiateVC(){
        self.applyGradientBgYellowToRed()
        self.setupNavigationBorder()
        self.profileView.cornerRadius = profileView.frame.width / 2
        self.setupTableView()
        self.addTapGesture()
    }
    
    private func setupTableView(){
        transactionTableView.register(HomeTransactionCell.nib, forCellReuseIdentifier: HomeTransactionCell.identifier)
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
    }
    
    private func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.goToNotifications))
        self.notificationIcon.addGestureRecognizer(tapGesture)
    }
    
    @objc private func goToNotifications(){
        self.navigationController?.pushViewController(NotificationVC(), animated: true)
    }
    
    // MARK: - IBAction
    @IBAction func viewAllBtnTapped(_ sender: UIButton) {
        self.tabSwitchDelegate.switchToTransactionTab()
    }
}

// MARK: - UITableView Extension
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTransactionCell.identifier, for: indexPath) as! HomeTransactionCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
