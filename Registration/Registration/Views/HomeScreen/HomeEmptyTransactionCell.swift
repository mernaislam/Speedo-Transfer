//
//  HomeEmptyTransactionCell.swift
//  Registration
//
//  Created by Merna Islam on 11/09/2024.
//

import UIKit

class HomeEmptyTransactionCell: UITableViewCell {
    
    static let identifier = "HomeEmptyTransactionCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    var delegate: TransferVCDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func transferBTntapped(_ sender: UIButton) {
        delegate?.goToTransfer()
    }
}
