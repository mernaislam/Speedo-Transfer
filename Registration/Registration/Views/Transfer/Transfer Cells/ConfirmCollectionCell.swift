//
//  ConfirmCollectionCell.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

class ConfirmCollectionCell: UICollectionViewCell {

    // MARK: - Properities
    static let identifier = "ConfirmCollectionCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    var delegate: CustomCellDelegate?
    
    // MARK: - IBOutlet
    @IBOutlet var previousBtn: UIButton!
    
    // MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.previousBtn.layer.borderColor = AppColors.primaryColor.cgColor
        self.previousBtn.layer.borderWidth = 1.5
        self.previousBtn.layer.cornerRadius = 5
    }

    // MARK: - IBAction
    @IBAction func confirmBtnTapped(_ sender: Any) {
        delegate?.goToCell(in: self, next: true)
        delegate?.animateStepColorChange(step: 3)
    }
    
    @IBAction func previousBtnTapped(_ sender: Any) {
        delegate?.goToCell(in: self, next: false)
        delegate?.animateStepColorChange(step: -1)
    }
}
