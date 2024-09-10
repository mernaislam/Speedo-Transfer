//
//  ProfileInformationCell.swift
//  Registration
//
//  Created by Malak Mohamed on 10/09/2024.
//

import UIKit

class ProfileInformationCell: UITableViewCell {
    
    static let identifier = "ProfileInformationCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(detailItem: DetailItem) {
        titleLabel.text = detailItem.title
        subTitleLabel.text = detailItem.subTitle
    }
}
