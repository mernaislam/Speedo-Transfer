//
//  AmountTransferVC.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

class TransferVC: UIViewController {

    @IBOutlet var firstStepView: UIView!
    @IBOutlet var secondStepView: UIView!
    @IBOutlet var thirdStepView: UIView!
    @IBOutlet var transferCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyGradientBgYellowToRed()
        self.setupNavigationBar(title: "Transfer")
        self.setUpStepperViews()
        self.setUpTableView()
    }
    
    private func setUpTableView(){
        self.transferCollectionView.register(AmountCollectionCell.nib, forCellWithReuseIdentifier: AmountCollectionCell.identifier)
        self.transferCollectionView.register(ConfirmCollectionCell.nib, forCellWithReuseIdentifier: ConfirmCollectionCell.identifier)
//        self.transferCollectionView.isScrollEnabled = false
        self.transferCollectionView.delegate = self
        self.transferCollectionView.dataSource = self
        self.transferCollectionView.backgroundColor = .clear
    }

    private func setUpStepperViews(){
        let sz = self.firstStepView.frame.width
        
        self.firstStepView.layer.borderWidth = 2
        self.firstStepView.layer.borderColor = AppColors.primaryColor.cgColor
        self.firstStepView.layer.cornerRadius = sz / 2
        
        self.secondStepView.layer.borderWidth = 2
        self.secondStepView.layer.borderColor = UIColor.lightGray.cgColor
        self.secondStepView.layer.cornerRadius = sz / 2
        
        
        self.thirdStepView.layer.borderWidth = 2
        self.thirdStepView.layer.borderColor = UIColor.lightGray.cgColor
        self.thirdStepView.layer.cornerRadius = sz / 2
        
    }
}


extension TransferVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AmountCollectionCell.identifier, for: indexPath) as! AmountCollectionCell
            cell.delegate = self
            return cell
        }
//        if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConfirmCollectionCell.identifier, for: indexPath) as! ConfirmCollectionCell
            cell.delegate = self
            return cell
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}

extension TransferVC: CustomCollectionViewCellDelegate {
    func goToPreviousCell(in cell: UICollectionViewCell) {
        guard let indexPath = self.transferCollectionView.indexPath(for: cell) else { return }
        let previousItem = IndexPath(item: indexPath.item - 1, section: indexPath.section)
        
        if previousItem.item >= 0 {
            self.transferCollectionView.scrollToItem(at: previousItem, at: .centeredHorizontally, animated: true)
        }
    }
    
    func goToNextCell(in cell: UICollectionViewCell) {
        guard let indexPath = self.transferCollectionView.indexPath(for: cell) else { return }
        let nextItem = IndexPath(item: indexPath.item + 1, section: indexPath.section)
        
        if nextItem.item < self.transferCollectionView.numberOfItems(inSection: nextItem.section) {
            self.transferCollectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
        }
    }
}
