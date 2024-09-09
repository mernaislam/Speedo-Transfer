//
//  FavoriteViewCell.swift
//  Registration
//
//  Created by Merna Islam on 08/09/2024.
//

import UIKit

class FavoriteSheetViewCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let identifier = "FavoriteSheetViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)

    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
