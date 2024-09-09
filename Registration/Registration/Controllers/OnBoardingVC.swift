//
//  OnBoardingVC.swift
//  Registration
//
//  Created by Merna Islam on 28/08/2024.
//

import UIKit

class OnBoardingVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var verticalSpace: NSLayoutConstraint!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var slides: [OnBoardingModel]!
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fillSlides()
        setupCollectionView()
        setVerticalSpace()
        self.applyGradientBgWhiteToRed()
    }
    
    override func viewDidLayoutSubviews() {
        if UIScreen.main.bounds.size.height <= 700 {
            pageControl.subviews.forEach {
                $0.transform = CGAffineTransform(scaleX: 1, y: 1)}
        } else {
            pageControl.subviews.forEach {
                $0.transform = CGAffineTransform(scaleX: 2, y: 2)}
        }
        
        pageControl.numberOfPages = slides.count
    }
    
    // MARK: - IBAction
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            goToRegisterScreen()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func skipBtnTapped(_ sender: UIButton) {
        goToRegisterScreen()
    }
    
    // MARK: - Private Methods
    private func fillSlides(){
        slides = [
            OnBoardingModel(title: "Amount", description: "Send money fast with simple steps. Create account, Confirmation, Payment. Simple.", image: UIImage(imageLiteralResourceName: "Amount")),
            
            OnBoardingModel(title: "Confirmation", description: "Transfer funds instantly to friends and family worldwide, strong shield protecting a money.", image: UIImage(imageLiteralResourceName: "Confirmation")),
            
            OnBoardingModel(title: "Payment", description: "Enjoy peace of mind with our secure platform  Transfer funds instantly to friends.", image: UIImage(imageLiteralResourceName: "Payment"))
        ]
    }
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: OnBoardingViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: OnBoardingViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
    }
    
    private func setVerticalSpace() {
        if UIScreen.main.bounds.size.height <= 700 {
            verticalSpace.constant = 140
        } else {
            verticalSpace.constant = 180
        }
    }
    
    private func goToRegisterScreen(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Add a fade transition animation
        UIView.transition(with: appDelegate.window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            appDelegate.switchToRegisterScreen()
        }, completion: nil)
    }
    
}

// MARK: - Collection View Extension
extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingViewCell.identifier, for: indexPath) as! OnBoardingViewCell
        cell.configureCell(slides[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
