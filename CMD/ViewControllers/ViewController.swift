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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255/255.0, green: 250/255.0, blue: 235/255.0, alpha: 1.0)
        setUpLabelUI()
        Task {
            await fetchClinics()
        }
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
}

