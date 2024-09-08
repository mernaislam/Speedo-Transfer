//
//  FavoriteSheetVC.swift
//  Registration
//
//  Created by Merna Islam on 08/09/2024.

import UIKit

class FavoriteSheetVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var favoriteTableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoriteTableView.register(FavoriteViewCell.nib, forCellReuseIdentifier: FavoriteViewCell.identifier)
        self.createSheet()
        self.setUpTableView()
      
    }
    
    // MARK: - Private Methods
    private func createSheet(){
        if let sheet = self.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 50
        }
    }
    
    private func setUpTableView(){
        self.favoriteTableView.delegate = self
        self.favoriteTableView.dataSource = self
    }
}

// MARK: - UITableView Extension
extension FavoriteSheetVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteViewCell.identifier, for: indexPath) as! FavoriteViewCell
        
        return cell
    }
    
    
}
