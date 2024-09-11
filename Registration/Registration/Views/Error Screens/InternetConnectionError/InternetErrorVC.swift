//
//  InternetErrorVC.swift
//  Registration
//
//  Created by Malak Mohamed on 09/09/2024.
//

import UIKit

class InternetErrorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


 
    @IBAction func UpdateButtonTapped(_ sender: Any) {
        // Check if the internet is back
                if NetworkManager.isConnectedToInternet() {
                    // Dismiss the error screen if internet is available
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // Optionally, you can show an alert or message that the internet is still unavailable
                    let alert = UIAlertController(title: "No Internet", message: "Internet is still unavailable. Please try again later.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
    }
}
