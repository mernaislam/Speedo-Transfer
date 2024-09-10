//
//  ProfileInfoViewCell.swift
//  Registration
//
//  Created by Merna Islam on 10/09/2024.
//

import UIKit

class ProfileInfoViewCell: UITableViewCell {

    static let identifier = "ProfileInfoViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
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
