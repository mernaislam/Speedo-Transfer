//
//  HomeTransactionCell.swift
//  Registration
//
//  Created by Merna Islam on 02/09/2024.
//

import UIKit

class HomeTransactionCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    
    // MARK: - Static Properities
    static var identifier: String = "HomeTransactionCell"
    static var nib: UINib = UINib(nibName: identifier, bundle: nil)
    
    // MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
