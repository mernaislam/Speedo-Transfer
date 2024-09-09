//
//  MoreVC.swift
//  Registration
//
//  Created by Merna Islam on 09/09/2024.
//

import UIKit

class MoreVC: UIViewController {

    @IBOutlet var moreTableView: UITableView!
    
    var tabSwitchDelegate: TabSwitchProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyGradientBgYellowToRed()
        self.setupNavigationBar(title: "More", selector: #selector(self.goBack))
        self.moreTableView.register(MoreViewCell.nib, forCellReuseIdentifier: MoreViewCell.identifier)
        self.moreTableView.delegate = self
        self.moreTableView.dataSource = self
        self.moreTableView.backgroundColor = .clear
    }
    
    @objc func goBack(){
        self.tabSwitchDelegate?.switchToHomeTab()
    }
}

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
        moreItems[indexPath.row].action()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
