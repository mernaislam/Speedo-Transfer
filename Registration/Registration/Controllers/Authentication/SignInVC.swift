import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    let emailIcon = UIImageView(image: UIImage(named: "email"))
    let eyeOpenIconPassword = UIImageView(image: UIImage(named: "eye open"))
    
    var isPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton

        configureSignUpButton()
        setupIcons()
    }
    
    private func checkIfUserIsRegistered() -> Bool{
        let userDefaults = UserDefaults.standard
        if let isRegistered = userDefaults.value(forKey: "isRegistered") as? Bool, isRegistered {
            if let fullName = userDefaults.value(forKey: "fullName") as? String,
               let email = userDefaults.value(forKey: "email") as? String {
                print("User is registered")
                print("Full Name: \(fullName)")
                print("Email: \(email)")
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
    
    private func setupIcons() {
        // Setup for Email text field
        emailIcon.frame = CGRect(x: -14, y: 0, width: 24, height: 24)
        let paddingEmail = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
        paddingEmail.addSubview(emailIcon)
        EmailTextField.rightView = paddingEmail
        EmailTextField.rightViewMode = .always
        
        // Setup for Password text field (eye open icon)
        eyeOpenIconPassword.frame = CGRect(x: -14, y: 0, width: 24, height: 24)
        let paddingEyePassword = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
        paddingEyePassword.addSubview(eyeOpenIconPassword)
        PasswordTextField.rightView = paddingEyePassword
        PasswordTextField.rightViewMode = .always
        
        // Add tap gesture recognizer to toggle password visibility
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility(_:)))
        eyeOpenIconPassword.isUserInteractionEnabled = true
        eyeOpenIconPassword.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - Toggle Password Visibility
    
    @objc func togglePasswordVisibility(_ sender: UITapGestureRecognizer) {
        isPasswordVisible.toggle()
        PasswordTextField.isSecureTextEntry = !isPasswordVisible
        eyeOpenIconPassword.image = UIImage(named: isPasswordVisible ? "closed eye" : "eye open")
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
        if registered {
            print("User Found!")
        } else {
            print("User wasn't found.")
        }
        self.navigationController?.pushViewController(HomeVC(), animated: true)
    }
}
