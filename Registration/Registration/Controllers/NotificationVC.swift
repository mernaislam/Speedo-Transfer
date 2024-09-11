//
//  NotificationVC.swift
//  Registration
//
//  Created by Merna Islam on 10/09/2024.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet var notificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateVC()
    }
    // MARK: - Private Methods
    private func initiateVC(){
        self.applyGradientBgYellowToRed()
        self.setupNavigationBar(title: "More", selector: #selector(self.goBack))
        self.setupTableView()
    }
    
    private func setupTableView(){
        self.notificationTableView.register(NotificationViewCell.nib, forCellReuseIdentifier: NotificationViewCell.identifier)
        self.notificationTableView.delegate = self
        self.notificationTableView.dataSource = self
        self.notificationTableView.backgroundColor = .clear
    }
    
    @objc private func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    

}

// MARK: - UITableView Extension
extension NotificationVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationViewCell.identifier, for: indexPath) as! NotificationViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(TransactionDetailsVC(), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
