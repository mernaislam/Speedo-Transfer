//
//  ConfirmCollectionCell.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

class ConfirmCollectionCell: UICollectionViewCell {

    // MARK: - Static Properties
    static let identifier = "ConfirmCollectionCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    // MARK: - Properities
    var amount: Double? {
        didSet {
            fillDetails()
        }
    }
    var delegate: CustomCellDelegate?

    // MARK: - IBOutlet
    @IBOutlet var cellView: UIView!
    @IBOutlet var transferAmount: UILabel!
    @IBOutlet var totalAmount: UILabel!
    @IBOutlet var senderName: UILabel!
    @IBOutlet var senderAccountNum: UILabel!
    @IBOutlet var receiverName: UILabel!
    @IBOutlet var receiverAccountNum: UILabel!
    @IBOutlet var previousBtn: UIButton!
    
    // MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.previousBtn.layer.borderColor = AppColors.primaryColor.cgColor
        self.previousBtn.layer.borderWidth = 1.5
        self.previousBtn.layer.cornerRadius = 5
    }
    
    // MARK: - Private Methods
    private func fillDetails(){
        self.transferAmount.text = "\(amount!) EGP"
        self.totalAmount.text = "\(amount!) EGP"
        self.senderName.text = currentTransaction!.senderAccount.name
        self.senderAccountNum.text = currentTransaction!.senderAccount.accountNumber
        self.receiverName.text = currentTransaction!.receiverAccount.name
        self.receiverAccountNum.text = currentTransaction!.receiverAccount.accountNumber
        
    }
    
    // MARK: - API Methods
    private func transfer(){
        APIManager.transfer(to: receiverAccountNum.text!, amount: amount!) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    print("Transfer successful")
                case .failure(let error):
                    print("Transfer failed: \(error.localizedDescription)")
                }
            }
        }
    }

    // MARK: - IBAction
    @IBAction func confirmBtnTapped(_ sender: Any) {
        self.transfer()
        delegate?.goToCell(in: self, next: true)
        delegate?.animateStepColorChange(step: 3)
        shouldUpdateHomeTransactions = true
        shouldUpdateTransactionsScreen = true
    }
    
    @IBAction func previousBtnTapped(_ sender: Any) {
        delegate?.goToCell(in: self, next: false)
        delegate?.animateStepColorChange(step: -1)
    }
}
