//
//  MoreVC.swift
//  Registration
//
//  Created by Merna Islam on 09/09/2024.
//

import UIKit

class MoreVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var moreTableView: UITableView!
    
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
        self.setupNavigationBar(title: "More", selector: #selector(self.goBack))
        self.setupTableView()
    }
    
    private func setupTableView(){
        self.moreTableView.register(MoreViewCell.nib, forCellReuseIdentifier: MoreViewCell.identifier)
        self.moreTableView.delegate = self
        self.moreTableView.dataSource = self
        self.moreTableView.backgroundColor = .clear
    }
    
    @objc private func goBack(){
        self.tabSwitchDelegate?.switchToHomeTab()
    }
    
    private func pushViewController(for item: Int) {
        switch item {
        case 1:
            self.navigationController?.pushViewController(FavoriteVC(), animated: true)
        case 4:
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.switchToLoginScreen()
        default:
            break
        }
    }
}

// MARK: - UITableView Extension
extension MoreVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreViewCell.identifier, for: indexPath) as! MoreViewCell
        let i = indexPath.row
        cell.prefixICon.image = moreItems[i].prefixIcon
        cell.titleLabel.text = moreItems[i].title
        if i == moreItems.count - 1{
            cell.separatorView.backgroundColor = .clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushViewController(for: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
