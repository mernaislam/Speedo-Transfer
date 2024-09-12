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
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameProfile: UILabel!
    @IBOutlet var transactionTableView: UITableView!
    @IBOutlet var notificationIcon: UIImageView!
    // For hiding it
    @IBOutlet var profileStackView: UIStackView!
    @IBOutlet var balanceView: UIView!
    @IBOutlet var viewAllStackView: UIStackView!
    
    // MARK: - Properties
    var tabSwitchDelegate: TabSwitchProtocol!
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private var transactions: [TransactionModel] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if shouldUpdateHomeTransactions {
            self.activityIndicator.startAnimating()
            self.toggleViewsVisibility(alpha: 0)
            self.getBalance()
            self.getTransactions()
            shouldUpdateHomeTransactions = false
        }
        
    }

    // MARK: - Private Methods
    private func initiateVC() {
        self.applyGradientBgYellowToRed()
        self.setupNavigationBorder()
        self.profileView.cornerRadius = profileView.frame.width / 2
        self.setupTableView()
        self.setupActivityIndicator()
        self.addTapGesture()
    }
    
    private func setupActivityIndicator(){
        self.activityIndicator.center = self.view.center
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.color = .gray
        self.view.addSubview(activityIndicator)
    }
    
    private func toggleViewsVisibility(alpha: Double){
        self.transactionTableView.alpha = alpha
        self.profileStackView.alpha = alpha
        self.balanceView.alpha = alpha
        self.viewAllStackView.alpha = alpha
        self.profileView.alpha = alpha
        self.notificationIcon.alpha = alpha
    }
    
    private func setupTableView(){
        self.transactionTableView.register(HomeTransactionCell.nib, forCellReuseIdentifier: HomeTransactionCell.identifier)
        self.transactionTableView.register(HomeEmptyTransactionCell.nib, forCellReuseIdentifier: HomeEmptyTransactionCell.identifier)
        self.transactionTableView.delegate = self
        self.transactionTableView.dataSource = self
        self.transactionTableView.backgroundColor = .clear
    }
    
    private func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.goToNotifications))
        self.notificationIcon.addGestureRecognizer(tapGesture)
    }
    
    @objc private func goToNotifications(){
        self.navigationController?.pushViewController(NotificationVC(), animated: true)
    }
    
    // MARK: - API Methods
    private func getTransactions(){
        APIManager.getTransactions { result in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                UIView.animate(withDuration: 0.3) {
                    self.toggleViewsVisibility(alpha: 1)
                }
                print(currentUser.name)
                print(self.transactions.count)
                if currentUser.name == "" && self.transactions.count != 0{
                    self.fillCurrentUserData()
                }
        
                switch result {
                case .success(let transactions):
                    self.transactions = transactions
                    self.transactions = self.transactions.filter( {$0.amount != 0.1})
                    self.transactionTableView.reloadData()
                    
                case .failure(_):
                    print("Token expired")
                }
            }
        }
    }
    
    private func fillCurrentUserData(){
        let user = self.transactions[0].senderAccount
        currentUser.name = user.name
        currentUser.email = user.email
        currentUser.bankAccount = user.accountNumber
        currentUser.country = user.country
        currentUser.balance = user.balance
        currentUser.dateOfBirth = user.dateOfBirth
        self.nameLabel.text = user.name
        self.nameProfile.text = AppHelper.getInitials(from: user.name)
    }
    
    private func getBalance() {
        APIManager.getBalance { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let balance):
                    currentBalance = balance
                    let balanceInt = Int(balance)
                    self.balanceLabel.text = "\(balanceInt)"
                case .failure(_):
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.switchToLoginScreen()
                }
            }
        }
    }
    
    // MARK: - IBAction
    @IBAction func viewAllBtnTapped(_ sender: UIButton) {
        self.tabSwitchDelegate.switchToTransactionTab()
    }
}

// MARK: - UITableView Extension
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cnt = self.transactions.count
        if cnt == 0 {
            return cnt + 1
        }
        return cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.transactions.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeEmptyTransactionCell.identifier, for: indexPath) as! HomeEmptyTransactionCell
            cell.delegate = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTransactionCell.identifier, for: indexPath) as! HomeTransactionCell
        cell.configureCell(transaction: self.transactions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.transactions.isEmpty {
            return tableView.frame.height
        }
        return 85
    }
}


// MARK: - TransferVCDelegate Extension
extension HomeVC: TransferVCDelegate {
    func goToTransfer() {
        self.tabSwitchDelegate.switchToTransferTab()
    }
}
