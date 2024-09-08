//
//  SuccessfulTransferCollectionCell.swift
//  Registration
//
//  Created by Merna Islam on 07/09/2024.
//

import UIKit

class SuccessCollectionCell: UICollectionViewCell {
    
    // MARK: - Properities
    static let identifier = "SuccessCollectionCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    var delegate: CustomCellDelegate?

    // MARK: - IBOutlet
    @IBOutlet var addToFavoritesBtn: UIButton!
    
    // MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addToFavoritesBtn.layer.borderColor = AppColors.primaryColor.cgColor
        self.addToFavoritesBtn.layer.borderWidth = 1.5
        self.addToFavoritesBtn.layer.cornerRadius = 5
    }
    
    // MARK: - IBAction
    @IBAction func backToHomeBtnTapped(_ sender: UIButton) {
        self.delegate?.goToHome()
    }
    
    @IBAction func addToFavoriteBtnTapped(_ sender: UIButton) {
    }
    
}
