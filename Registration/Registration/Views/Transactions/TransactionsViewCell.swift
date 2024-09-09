//
//  TransactionsViewCell.swift
//  Registration
//
//  Created by Merna Islam on 04/09/2024.
//

import UIKit

class TransactionsViewCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let identifier = "TransactionsViewCell"
    static let nib = UINib(nibName: "TransactionsViewCell", bundle: nil)
    
    // MARK: - IBOutlet
    @IBOutlet var cellView: UIView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Other Methods
    func configureCell(){
        
    }
    
}
