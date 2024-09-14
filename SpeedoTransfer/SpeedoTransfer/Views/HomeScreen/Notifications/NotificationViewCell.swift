//
//  NotificationViewCell.swift
//  Registration
//
//  Created by Merna Islam on 10/09/2024.
//

import UIKit

class NotificationViewCell: UITableViewCell {
    
    @IBOutlet var notificationBody: UILabel!
    @IBOutlet var notificationDate: UILabel!
    static let identifier = "NotificationViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)

    @IBOutlet var iconView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.shadowColor = UIColor.systemGray2.cgColor
        iconView.layer.shadowOpacity = 1
        iconView.layer.shadowOffset = CGSize(width: 1, height: 1)
        iconView.layer.shadowRadius = 1
        iconView.layer.shouldRasterize = true
        iconView.layer.rasterizationScale = UIScreen.main.scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(transaction: TransactionModel){
        notificationBody.text = "You have sent \(transaction.amount) EGP to \(transaction.receiverAccount.name)"
        notificationDate.text = transaction.formatFullDatetime()
    }
}
