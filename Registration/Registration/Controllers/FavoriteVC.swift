//
//  FavoriteVC.swift
//  Registration
//
//  Created by Merna Islam on 09/09/2024.
//

import UIKit

class FavoriteVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var favoriteTableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateVC()
    }
    
    // MARK: - Private Methods
    private func initiateVC(){
        self.applyGradientBgYellowToRed()
        self.setupNavigationBar(title: "Favorites", selector: #selector(self.goBack))
        self.setupTableView()
    }
    
    private func setupTableView(){
        self.favoriteTableView.register(FavoriteViewCell.nib, forCellReuseIdentifier: FavoriteViewCell.identifier)
        self.favoriteTableView.dataSource = self
        self.favoriteTableView.delegate = self
        self.favoriteTableView.backgroundColor = .clear
    }
    
    @objc private func goBack(){
        self.navigationController?.popViewController(animated: true)
    }

}

// MARK: - UITableView Extension
extension FavoriteVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteViewCell.identifier, for: indexPath) as! FavoriteViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - FavoritesProtocol Extension
extension FavoriteVC: FavoritesProtocol{
    func openEditSheet() {
        self.navigationController?.present(EditFavoriteSheetVC(), animated: true)
    }
}
