//
//  ProfileInformationVC.swift
//  Registration
//
//  Created by Malak Mohamed on 10/09/2024.
//

import UIKit

class ProfileInfoVC: UIViewController {

    
    @IBOutlet var detailsTableView: UITableView!
    var user: User?

    var profileDetails: [DetailItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileDetails()
        setupTableView()
        self.setupNavigationBar(title: "Profile Information", selector: #selector(self.goBack))
        self.applyGradientBgYellowToRed()
        
    }
    
    @objc private func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView() {
        detailsTableView.register(ProfileInfoViewCell.nib, forCellReuseIdentifier: ProfileInfoViewCell.identifier)
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        detailsTableView.backgroundColor = .clear
    }
    
    private func setupProfileDetails() {
//        guard let user = user else { return }
        user = User(name: "Malak", email: "Malak brdo", password: "ajksjaks", confirmPassword: "ajksjaks", country: "Egypt", dateOfBirth: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        profileDetails = [
            DetailItem(title: "Full Name", subTitle: user!.name),
            DetailItem(title: "Email", subTitle: user!.email),
//            DetailItem(title: "Date Of Birth", subTitle: dateFormatter.string(from: user!.dateOfBirth)),
            DetailItem(title: "Country", subTitle: user!.country),
//            DetailItem(title: "Bank Account", subTitle: user!.bankAccount)
        ]
        
        detailsTableView.reloadData()
    }
    
}

extension ProfileInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(profileDetails.count)
        return profileDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoViewCell.identifier, for: indexPath) as! ProfileInfoViewCell
        let detailItem = profileDetails[indexPath.row]
        cell.configureCell(detailItem: detailItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

struct DetailItem {
    let title: String
    let subTitle: String
}
