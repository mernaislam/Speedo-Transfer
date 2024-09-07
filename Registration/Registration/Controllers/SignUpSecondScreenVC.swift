//
//  SignUpVC2.swift
//  Registration
//
//  Created by Malak Mohamed on 29/08/2024.
//

import UIKit

class SignUpVC2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var CountrySelectionMenu: UIPickerView!
    @IBOutlet weak var DateSelectionMenu: UIDatePicker!
    
    // Variables to hold user data passed from SignUpVC1
    var userFullName: String?
    var userEmail: String?
    var userPassword: String?
    
    // List of countries
    let countries = ["United States", "Canada", "United Kingdom", "Australia", "Germany", "France", "Egypt", "India", "China", "Japan"]
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the picker view
        CountrySelectionMenu.dataSource = self
        CountrySelectionMenu.delegate = self
        selectedCountry = countries.first
    }
    
    // MARK: - UIPickerView DataSource and Delegate methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countries[row]
    }
    
    // MARK: - Actions
    
    @IBAction func ContinueButtonTapped(_ sender: Any) {
        let selectedDate = DateSelectionMenu.date
        
        if let fullName = userFullName, let email = userEmail, let password = userPassword, let country = selectedCountry {
            let newUser = User(fullName: fullName, email: email, password: password, country: country, dateOfBirth: selectedDate)
            
            // Add user registration logic here, e.g., send data to a server or save it locally
            
            print("User created: \(newUser)")
            // Navigate to the next screen or show a success message
        }
    }
}

