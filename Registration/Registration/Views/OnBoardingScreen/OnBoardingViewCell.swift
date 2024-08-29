//
//  OnBoardingViewCell.swift
//  Registration
//
//  Created by Merna Islam on 29/08/2024.
//

import UIKit

class OnBoardingViewCell: UICollectionViewCell {
    
    static let identifier = "OnBoardingViewCell"
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescription: UILabel!
    @IBOutlet weak var slideTitle: UILabel!
    
    func configureCell(_ onBoardingModel: OnBoardingModel){
        slideImageView.image = onBoardingModel.image
        slideTitle.text = onBoardingModel.title
        slideDescription.text = onBoardingModel.description
    }
}
