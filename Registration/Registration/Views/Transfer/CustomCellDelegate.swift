//
//  CustomDelegate.swift
//  Registration
//
//  Created by Merna Islam on 07/09/2024.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func goToCell(in cell: UICollectionViewCell, next: Bool)
    func animateStepColorChange(step: Int)
    func goToHome()
    func openFavoritesSheet()
}
