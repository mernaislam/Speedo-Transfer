//
//  AmountTransferVC.swift
//  Registration
//
//  Created by Merna Islam on 06/09/2024.
//

import UIKit

class TransferVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var firstStepView: UIView!
    @IBOutlet var secondStepView: UIView!
    @IBOutlet var thirdStepView: UIView!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var secondLine: UIView!
    @IBOutlet var transferCollectionView: UICollectionView!
   
    // MARK: - Properities
    let gradientLayer = CAGradientLayer()
    var tabSwitchDelegate: TabSwitchProtocol?
    

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyGradientBgYellowToRed()
        self.setupNavigationBar(title: "Transfer", selector: #selector(self.goBack))
        self.setUpStepperViews()
        self.setUpTableView()
    }
    
    // MARK: - Private Methods
    @objc func goBack(){
        if let visibleIndexPath = self.transferCollectionView.indexPathsForVisibleItems.first {
            let visibleCell = self.transferCollectionView.cellForItem(at: visibleIndexPath)
            if visibleCell is ConfirmCollectionCell {
                self.resetState()
            } else {
                self.resetState()
                self.tabSwitchDelegate?.switchToHomeTab()

            }
        }
    }
    
    private func setUpTableView(){
        // Cells Registration
        self.transferCollectionView.register(AmountCollectionCell.nib, forCellWithReuseIdentifier: AmountCollectionCell.identifier)
        self.transferCollectionView.register(ConfirmCollectionCell.nib, forCellWithReuseIdentifier: ConfirmCollectionCell.identifier)
        self.transferCollectionView.register(SuccessCollectionCell.nib, forCellWithReuseIdentifier: SuccessCollectionCell.identifier)
        // Collection View Setup
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
    
    private func setUpGradientLayer1(){
        gradientLayer.frame = secondLine.bounds
        gradientLayer.colors = [AppColors.primaryColor.cgColor, UIColor.lightGray.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = [0, 0]
        secondLine.layer.addSublayer(gradientLayer)
    }
    
    private func setUpGradientLayer2(){
        gradientLayer.frame = secondLine.bounds
        gradientLayer.colors = [UIColor.lightGray.cgColor, AppColors.primaryColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.locations = [1, 1]
        secondLine.layer.addSublayer(gradientLayer)
    }
    
    private func resetState(){
        let indexPath = IndexPath(item: 0, section: 0)
        self.transferCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        animateStepColorChange(step: -1)
        self.thirdStepView.layer.borderColor = UIColor.lightGray.cgColor
        self.thirdLabel.textColor = UIColor.lightGray
    }
}

// MARK: - UICollectionView Extension
extension TransferVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch(indexPath.row){
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AmountCollectionCell.identifier, for: indexPath) as! AmountCollectionCell
            cell.delegate = self
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConfirmCollectionCell.identifier, for: indexPath) as! ConfirmCollectionCell
            cell.delegate = self
            return cell
                        
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuccessCollectionCell.identifier, for: indexPath) as! SuccessCollectionCell
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
}

// MARK: - CellDelegate Extension
extension TransferVC: CustomCellDelegate {
    func goToFavorites() {
//        if let sheet = self.navigationController?.sheetPresentationController {
//            sheet.detents = [.medium()]
//        }
    }
    
    func goToHome() {
        self.resetState()
        self.tabSwitchDelegate?.switchToHomeTab()
    }
    
    func animateStepColorChange(step: Int) {
        let color = AppColors.primaryColor
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if step == 2 {
                self.setUpGradientLayer1()
                self.gradientLayer.locations = [1, 1]
                UIView.animate(withDuration: 0.5, animations: {
                    self.secondLabel.textColor = color
                    self.secondStepView.layer.borderColor = color.cgColor
                })
                let animation = CABasicAnimation(keyPath: "locations")
                animation.fromValue = [0, 0]
                animation.toValue = [1, 1]
                animation.duration = 1
                self.gradientLayer.add(animation, forKey: nil)

            } else if step == 3 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.thirdStepView.layer.borderColor = color.cgColor
                    self.thirdLabel.textColor = color
                })
            } else if step == -1 {
                self.setUpGradientLayer2()
                UIView.animate(withDuration: 1, animations: {
                    self.secondStepView.layer.borderColor = UIColor.lightGray.cgColor
                    self.secondLabel.textColor = UIColor.lightGray
                })
                self.gradientLayer.locations = [1, 1]
                let animation = CABasicAnimation(keyPath: "locations")
                animation.fromValue = [0, 0]
                animation.toValue = [1, 1]
                animation.duration = 1
                self.gradientLayer.add(animation, forKey: nil)
            }
        }
    }
    
    func goToCell(in cell: UICollectionViewCell, next: Bool) {
        var cnt = -1
        if next {
            cnt = 1
        }
        guard let indexPath = self.transferCollectionView.indexPath(for: cell) else { return }
        let item = IndexPath(item: indexPath.item + cnt, section: indexPath.section)
        self.transferCollectionView.scrollToItem(at: item, at: .centeredHorizontally, animated: true)
    }
}
