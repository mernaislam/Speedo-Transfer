//
//  FavoriteVC.swift
//  Registration
//
//  Created by Merna Islam on 09/09/2024.
//

import UIKit

class FavoriteVC: UIViewController {

    @IBOutlet var favoriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyGradientBgYellowToRed()
        self.favoriteTableView.register(FavoriteViewCell.nib, forCellReuseIdentifier: FavoriteViewCell.identifier)
        self.setupNavigationBar(title: "Favorites", selector: #selector(self.goBack))
        self.favoriteTableView.dataSource = self
        self.favoriteTableView.delegate = self
        self.favoriteTableView.backgroundColor = .clear

    }
    
    @objc private func goBack(){
        self.navigationController?.popViewController(animated: true)
    }

}

extension FavoriteVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteViewCell.identifier, for: indexPath) as! FavoriteViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
