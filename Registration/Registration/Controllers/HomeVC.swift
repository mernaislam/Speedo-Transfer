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
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.applyGradientBgYellowToRed()
        profileView.cornerRadius = profileView.frame.width / 2
    }
    
    // MARK: - Private Methods
    private func setUpTableView(){
        transactionTableView.register(HomeTransactionCell.nib, forCellReuseIdentifier: HomeTransactionCell.identifier)
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
    }
    
    // MARK: - IBAction
    @IBAction func viewAllBtnTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(TransactionsVC(), animated: true)
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
