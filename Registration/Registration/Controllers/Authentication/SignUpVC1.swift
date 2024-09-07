import UIKit

class SignUpVC1: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var FullNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ConfPasswordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    let userIcon = UIImageView(image: UIImage(named: "user"))
    let emailIcon = UIImageView(image: UIImage(named: "email"))
    let eyeOpenIconPassword = UIImageView(image: UIImage(named: "eye open"))
    let eyeOpenIconConfPassword = UIImageView(image: UIImage(named: "eye open"))
    
    var isPasswordVisible = false
    var isConfPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
        
        setupIcons()
        
        FullNameTextField.delegate = self
        EmailTextField.delegate = self
        PasswordTextField.delegate = self
        ConfPasswordTextField.delegate = self
        
        configureSignInButton()
    }
    
    private func setupIcons() {
        // Setup for Full Name text field
        userIcon.frame = CGRect(x: -14, y: 0, width: 24, height: 24)
        let paddingUser = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
        paddingUser.addSubview(userIcon)
        FullNameTextField.rightView = paddingUser
        FullNameTextField.rightViewMode = .always
        
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
        
        // Setup for Confirm Password text field (eye open icon)
        eyeOpenIconConfPassword.frame = CGRect(x: -14, y: 0, width: 24, height: 24)
        let paddingEyeConfPassword = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
        paddingEyeConfPassword.addSubview(eyeOpenIconConfPassword)
//        ConfPasswordTextField.rightView = paddingEyeConfPassword
//        ConfPasswordTextField.rightViewMode = .always
        
        // Add tap gesture recognizers for eye icons to toggle password visibility
        let tapGesturePassword = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility(_:)))
        eyeOpenIconPassword.isUserInteractionEnabled = true
        eyeOpenIconPassword.addGestureRecognizer(tapGesturePassword)
        
        let tapGestureConfPassword = UITapGestureRecognizer(target: self, action: #selector(toggleConfPasswordVisibility(_:)))
        eyeOpenIconConfPassword.isUserInteractionEnabled = true
        eyeOpenIconConfPassword.addGestureRecognizer(tapGestureConfPassword)
    }
    
    // MARK: - Toggle Password Visibility
    
    @objc func togglePasswordVisibility(_ sender: UITapGestureRecognizer) {
        isPasswordVisible.toggle()
        PasswordTextField.isSecureTextEntry = !isPasswordVisible
        eyeOpenIconPassword.image = UIImage(named: isPasswordVisible ? "closed eye" : "eye open")
    }
    
    @objc func toggleConfPasswordVisibility(_ sender: UITapGestureRecognizer) {
        isConfPasswordVisible.toggle()
        ConfPasswordTextField.isSecureTextEntry = !isConfPasswordVisible
        eyeOpenIconConfPassword.image = UIImage(named: isConfPasswordVisible ? "closed eye" : "eye open")
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        // Hide the icon when user starts typing
        switch textField {
        case FullNameTextField:
            FullNameTextField.rightView?.isHidden = true
        case EmailTextField:
            EmailTextField.rightView?.isHidden = true
        default:
            break
        }
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        // Show the icon again when user finishes typing
        switch textField {
        case FullNameTextField:
            FullNameTextField.rightView?.isHidden = FullNameTextField.text?.isEmpty == false
        case EmailTextField:
            EmailTextField.rightView?.isHidden = EmailTextField.text?.isEmpty == false
        default:
            break
        }
    }
    
    // Configure sign-in button
    private func configureSignInButton() {
        let signUpButtonTitle = "Sign In"
        let attributedTitle = NSMutableAttributedString(string: signUpButtonTitle)
        let range = NSRange(location: 0, length: attributedTitle.length)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: signInButton.titleLabel?.font ?? UIFont.systemFont(ofSize: 16),
            .foregroundColor: signInButton.titleLabel?.textColor ?? UIColor.systemBlue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        attributedTitle.addAttributes(attributes, range: range)
        
        signInButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    private func isValidData() -> Bool {
        guard let fullName = FullNameTextField.text, !fullName.isEmpty else {
            showAlert(message: "Full Name is required.")
            return false
        }
        
        guard let email = EmailTextField.text, !email.isEmpty else {
            showAlert(message: "Email is required.")
            return false
        }
        
        guard let password = PasswordTextField.text, !password.isEmpty else {
            showAlert(message: "Password is required.")
            return false
        }
        
        guard let confPassword = ConfPasswordTextField.text, !confPassword.isEmpty else {
            showAlert(message: "Confirm Password is required.")
            return false
        }
        
        guard password == confPassword else {
            showAlert(message: "Passwords do not match.")
            return false
        }
        
        guard isValidPassword(password) else {
            showAlert(message: "Password must be exactly 6 characters long, include at least one uppercase letter, one lowercase letter, and one special character.")
            return false
        }
        
        return true
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        print("Sign Up button tapped")
        if isValidData() {
            print("Data is valid, Going to next page")
            
            // Print the user data to verify
            let userData = UserData(fullName: FullNameTextField.text!,
                                        email: EmailTextField.text!,
                                        password: PasswordTextField.text!)
            print("UserData: \(userData)")
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let signUpVC2 = sb.instantiateViewController(withIdentifier: "SignUpVC2") as? SignUpVC2 else {
                print("Error: Unable to instantiate SignUpVC2 from storyboard.")
                return
            }
            
            // Pass data to SignUpVC2
            signUpVC2.userData = userData
            self.navigationController?.pushViewController(signUpVC2, animated: true)
        } else {
            print("Data is not valid")
        }
    }


    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[\\W_]).{6}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with: password)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func SignInButtonTapped(_ sender: Any) {
        print("sign in btnnnnn")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
}

// Define a struct to hold the data
struct UserData {
    var fullName: String
    var email: String
    var password: String
}
