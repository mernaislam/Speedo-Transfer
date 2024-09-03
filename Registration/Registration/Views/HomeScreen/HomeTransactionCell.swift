//
//  HomeTransactionCell.swift
//  Registration
//
//  Created by Merna Islam on 02/09/2024.
//

import UIKit

class HomeTransactionCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    static var identifier: String = "HomeTransactionCell"
    static var nib: UINib = UINib(nibName: identifier, bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
