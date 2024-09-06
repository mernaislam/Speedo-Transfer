//
//  AmountCollectionCell.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

protocol CustomCollectionViewCellDelegate: AnyObject {
    func goToNextCell(in cell: UICollectionViewCell)
    func goToPreviousCell(in cell: UICollectionViewCell)
}

class AmountCollectionCell: UICollectionViewCell {
    
    static let identifier = "AmountCollectionCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    weak var delegate: CustomCollectionViewCellDelegate?

    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var accountTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpTextFieldBorder()
    }
    
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
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        delegate?.goToNextCell(in: self)
    }
    
}
