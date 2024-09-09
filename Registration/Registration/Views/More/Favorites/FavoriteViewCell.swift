//
//  FavoriteViewCell.swift
//  Registration
//
//  Created by Merna Islam on 09/09/2024.
//

import UIKit

class FavoriteViewCell: UITableViewCell {
    
    // MARK: - Properities
    static let identifier = "FavoriteViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    weak var delegate: FavoritesProtocol?

    // MARK: - IBOutlet
    @IBOutlet var editView: UIView!
    @IBOutlet var deleteView: UIView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    // MARK: - Private Methods
    private func addGesture(){
        let openTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.openEditSheet))
        self.editView.addGestureRecognizer(openTapGesture)
        
        let deleteTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.deleteFavorite))
        self.deleteView.addGestureRecognizer(deleteTapGesture)
    }
    
    @objc private func openEditSheet(){
        self.delegate?.openEditSheet()
    }
    
    @objc private func deleteFavorite(){
        // TODO: delete
    }
    
}
