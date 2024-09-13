//
//  ContactMethodPickerVC.swift
//  Registration
//
//  Created by Malak Mohamed on 11/09/2024.
//

import UIKit

class ContactMethodPickerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // List of contact methods
    private let contactMethods = ["Email", "Phone"]
    
    var didSelectMethod: ((String) -> Void)?
    
    
    // Custom grabber view
    private let grabberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#3C3A37")
        view.layer.cornerRadius = 3
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactMethodCell")
        tableView.separatorStyle = .none
        self.applyGradientBgWhiteToRed()
        // Configure bottom sheet presentation
        if let sheet = self.sheetPresentationController {
            sheet.detents = [.medium()] // Medium detent for the bottom sheet
            sheet.prefersGrabberVisible = false // Hide the default grabber
            sheet.preferredCornerRadius = 50 // Set corner radius
        }

        // Add custom grabber and top spacer
        setupCustomGrabber()
    }
    
    // MARK: - UITableViewDelegate and UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactMethods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactMethodCell", for: indexPath)
        cell.textLabel?.text = contactMethods[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMethod = contactMethods[indexPath.row]
        didSelectMethod?(selectedMethod)
        dismiss(animated: true, completion: nil)
    }
    private func setupCustomGrabber() {
        let topSpacer = UIView()
        topSpacer.translatesAutoresizingMaskIntoConstraints = false
        topSpacer.backgroundColor = .clear

        view.addSubview(topSpacer)
        view.addSubview(grabberView)

        grabberView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Top spacer constraints
            topSpacer.topAnchor.constraint(equalTo: view.topAnchor),
            topSpacer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSpacer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSpacer.heightAnchor.constraint(equalToConstant: 24), // 24 points top space

            // Grabber view constraints
            grabberView.topAnchor.constraint(equalTo: topSpacer.bottomAnchor),
            grabberView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            grabberView.widthAnchor.constraint(equalToConstant: 50), // Wider grabber width
            grabberView.heightAnchor.constraint(equalToConstant: 4) // Grabber height
        ])
    }
}
