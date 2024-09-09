//
//  TransactionsVC.swift
//  Registration
//
//  Created by Merna Islam on 04/09/2024.
//

import UIKit

class TransactionsVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var transactionTableView: UITableView!
    
    // MARK: - Properties
    var tabSwitchDelegate: TabSwitchProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateVC()
    }
    
    // MARK: - Private Methods
    private func initiateVC(){
        self.applyGradientBgYellowToRed()
        self.setupNavigationBar(title: "Transactions", selector: #selector(self.goBack))
        self.setupTableView()
    }
    
    @objc private func goBack(){
        self.tabSwitchDelegate?.switchToHomeTab()
    }
    
    private func setupTableView(){
        transactionTableView.register(TransactionsViewCell.nib, forCellReuseIdentifier: TransactionsViewCell.identifier)
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        transactionTableView.backgroundColor = .clear
    }

}

// MARK: - UITableView Extension
extension TransactionsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionsViewCell.identifier, for: indexPath) as! TransactionsViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(TransactionDetailsVC(), animated: true)
    }
}
