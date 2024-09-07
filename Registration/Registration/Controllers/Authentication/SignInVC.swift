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
    
    private func checkIfUserIsRegistered() -> Bool{
        let userDefaults = UserDefaults.standard
        if let isRegistered = userDefaults.value(forKey: "isRegistered") as? Bool, isRegistered {
            // Retrieve and print user details
            if let fullName = userDefaults.value(forKey: "fullName") as? String,
               let email = userDefaults.value(forKey: "email") as? String {
                print("User is registered")
                print("Full Name: \(fullName)")
                print("Email: \(email)")
                // Print additional details if needed
            } else {
                print("User details are missing")
                return false
            }
        } else {
            print("User is not registered")
            return false
        }
        return true
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
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SignInButtonTapped(_ sender: Any) {
        
        let registered = checkIfUserIsRegistered()
        if registered{
            print("User Found!")
        }else{
            print("User wasn't found.")
        }
        self.navigationController?.pushViewController(HomeVC(), animated: true)
    }
    
}
