//
//  ViewController.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 25/06/25.
//

import UIKit

class ViewController: UIViewController {
    var clinic: [Clinic] = []
    var welcomeLabel = WelcomeLabel()
    var clinicListButton = ClinicListButton()
    var createClinicButton = ClinicListButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.view.backgroundColor = UIColor(red: 255/255.0, green: 250/255.0, blue: 235/255.0, alpha: 1.0)
        setUpLabelUI()
        setUpClinicButtonUI()
        setUpCreateClinicButton()
    }
    
    func setUpLabelUI(){
        view.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func setUpClinicButtonUI(){
        view.addSubview(clinicListButton)
        clinicListButton.translatesAutoresizingMaskIntoConstraints = false
        clinicListButton.setTitle(title: "View Clinics !!")
        clinicListButton.addTarget(self, action: #selector(clinicListButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            clinicListButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60),
            clinicListButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            clinicListButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            clinicListButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setUpCreateClinicButton(){
        view.addSubview(createClinicButton)
        createClinicButton.translatesAutoresizingMaskIntoConstraints = false
        createClinicButton.setTitle(title: "Create a new clinic")
        createClinicButton.addTarget(self, action: #selector(clinicCreateButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            createClinicButton.topAnchor.constraint(equalTo: clinicListButton.bottomAnchor, constant: 20),
            createClinicButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createClinicButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createClinicButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func fetchClinics() async {
        do {
            self.clinic = try await retrieveClinics()
            for clinic in self.clinic {
                print(clinic)
            }
        } catch {
            print("Failed to fetch clinics: \(error)")
        }
    }
    
    @objc func clinicListButtonTapped(){
        let destinationVC = ClinicListViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @objc func clinicCreateButtonTapped(){
        let destinationVC = CreateClinicViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

