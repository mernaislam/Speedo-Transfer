//
//  ConfirmCollectionCell.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

class ConfirmCollectionCell: UICollectionViewCell {

    static let identifier = "ConfirmCollectionCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    var delegate: CustomCollectionViewCellDelegate?
    
    @IBOutlet var previousBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.previousBtn.layer.borderColor = AppColors.primaryColor.cgColor
        self.previousBtn.layer.borderWidth = 1.5
        self.previousBtn.layer.cornerRadius = 5
    }

    @IBAction func confirmBtnTapped(_ sender: Any) {
        delegate?.goToNextCell(in: self)
    }
    
    @IBAction func previousBtnTapped(_ sender: Any) {
        delegate?.goToPreviousCell(in: self)
    }
}
