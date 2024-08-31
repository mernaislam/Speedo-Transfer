//
//  SignInVC.swift
//  Registration
//
//  Created by Malak Mohamed on 31/08/2024.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton

        // Do any additional setup after loading the view.
        configureSignUpButton()
    }
    private func configureSignUpButton() {
        let signUpButtonTitle = "Sign Up"
        let attributedTitle = NSMutableAttributedString(string: signUpButtonTitle)
        let range = NSRange(location: 0, length: attributedTitle.length)
        
        // Set font, color, and underline style
        let attributes: [NSAttributedString.Key: Any] = [
            .font: signUpButton.titleLabel?.font ?? UIFont.systemFont(ofSize: 16),
            .foregroundColor: signUpButton.titleLabel?.textColor ?? UIColor.systemBlue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        attributedTitle.addAttributes(attributes, range: range)
        
        signUpButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let signUpVC = sb.instantiateViewController(withIdentifier: "SignUpVC1") as! SignUpVC1
        self.navigationController?.popViewController(animated: true)
    }
}
