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
        // Do any additional setup after loading the view.
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
        return cell
    }
    
    
}
