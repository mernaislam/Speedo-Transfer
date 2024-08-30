import UIKit

class SignUpVC1: UIViewController {

    @IBOutlet weak var FullNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ConfPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
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
//        print("Sign Up button tapped")
//        if isValidData() {
//            print("Data is valid, Going to next page")
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let signUpVC2 = sb.instantiateViewController(withIdentifier: "SignUpVC2") as! SignUpVC2
          self.navigationController?.pushViewController(signUpVC2, animated: true)
//        } else {
//            print("Data is not valid")
//        }
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
}
