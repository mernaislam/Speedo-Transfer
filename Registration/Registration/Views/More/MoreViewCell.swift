//
//  MoreViewCell.swift
//  Registration
//
//  Created by Merna Islam on 09/09/2024.
//

import UIKit

class MoreViewCell: UITableViewCell {
    static let identifier = "MoreViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)

    @IBOutlet var separatorView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var prefixICon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
