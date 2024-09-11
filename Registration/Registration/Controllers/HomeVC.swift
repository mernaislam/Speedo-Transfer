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
    
    // For hiding it
    @IBOutlet var profileStackView: UIStackView!
    @IBOutlet var balanceView: UIView!
    @IBOutlet var viewAllStackView: UIStackView!
    
    // MARK: - Properties
    var tabSwitchDelegate: TabSwitchProtocol!
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.activityIndicator.startAnimating()
        self.getBalance()
    }

    // MARK: - Private Methods
    private func initiateVC() {
        self.applyGradientBgYellowToRed()
        self.setupNavigationBorder()
        self.profileView.cornerRadius = profileView.frame.width / 2
        self.setupTableView()
        self.setupActivityIndicator()
        self.toggleViewsVisibility(alpha: 0)
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
//        self.
    }
    
    private func getBalance() {
        APIManager.getBalance { result in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                UIView.animate(withDuration: 0.3) {
                    self.toggleViewsVisibility(alpha: 1)
                }
        
                switch result {
                case .success(let balance):
                    let balanceInt = Int(balance)
                    self.balanceLabel.text = "\(balanceInt)"
                    print("Balance: \(balanceInt)")
                    
                case .failure(let error):
                    self.balanceLabel.text = "Error"
                    print("Error fetching balance: \(error.localizedDescription)")
                }
            }
        }
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
