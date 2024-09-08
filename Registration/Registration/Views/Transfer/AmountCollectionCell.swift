//
//  AmountCollectionCell.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

class AmountCollectionCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "AmountCollectionCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    weak var delegate: CustomCellDelegate?

    // MARK: - IBOutlet
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var accountTextField: UITextField!
    @IBOutlet var favoriteStackView: UIStackView!
    
    // MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpTextFieldBorder()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openFavoriteSheet))
        favoriteStackView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Private Methods
    private func setUpTextFieldBorder(){
        // Amount
        self.amountTextField.borderStyle = .roundedRect
        self.amountTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.amountTextField.layer.borderWidth = 1.5
        self.amountTextField.layer.cornerRadius = 10
        
        // Name
        self.nameTextField.borderStyle = .roundedRect
        self.nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.nameTextField.layer.borderWidth = 1.5
        self.nameTextField.layer.cornerRadius = 5
        
        // Account
        self.accountTextField.borderStyle = .roundedRect
        self.accountTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.accountTextField.layer.borderWidth = 1.5
        self.accountTextField.layer.cornerRadius = 5
        
    }
    
    @objc private func openFavoriteSheet() {
        delegate?.goToFavorites()
    }
    
    // MARK: - IBAction
    @IBAction func continueBtnTapped(_ sender: Any) {
        delegate?.goToCell(in: self, next: true)
        delegate?.animateStepColorChange(step: 2)
    }
    
}


// MARK: - Scroll Extension
extension AmountCollectionCell: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}
