//
//  ProfileInformationVC.swift
//  Registration
//
//  Created by Malak Mohamed on 10/09/2024.
//

import UIKit

class ProfileInformationVC: UIViewController {

    @IBOutlet var detailsTableView: UITableView!
    
    var user: User? = nil

    var profileDetails: [DetailItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileDetails()
        setupTableView()
        self.setupNavigationBar(title: "Profile Information", selector: nil)
        self.applyGradientBgYellowToRed()
        
    }
    private func setupTableView() {
        detailsTableView.register(ProfileInformationCell.nib, forCellReuseIdentifier: ProfileInformationCell.identifier)
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        detailsTableView.backgroundColor = .clear
    }
    
    private func setupProfileDetails() {
        guard let user = user else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        profileDetails = [
            DetailItem(title: "Full Name", subTitle: user.fullName),
            DetailItem(title: "Email", subTitle: user.email),
            DetailItem(title: "Date Of Birth", subTitle: dateFormatter.string(from: user.dateOfBirth)),
            DetailItem(title: "Country", subTitle: user.country),
            DetailItem(title: "Password", subTitle: "********")
        ]
        
        detailsTableView.reloadData()
    }
    
}

extension ProfileInformationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInformationCell.identifier, for: indexPath) as! ProfileInformationCell
        let detailItem = profileDetails[indexPath.row]
        cell.configureCell(detailItem: detailItem)
        return cell
    }
    
}

struct DetailItem {
    let title: String
    let subTitle: String
}
