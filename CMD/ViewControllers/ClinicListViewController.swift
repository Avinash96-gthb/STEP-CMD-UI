//
//  ClinicListViewController.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 25/06/25.
//

import UIKit

class ClinicListViewController: UIViewController {
    
    var clinic: [Clinic] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "All Clinics"
        Task {
            await fetchClinics()
        }
    
    }
    
    func setUpUI(){
        self.view.backgroundColor = UIColor(red: 255/255.0, green: 250/255.0, blue: 235/255.0, alpha: 1.0)
        let clinicListCollectionView = ClinicListCollectionView(clinics: clinic)
        clinicListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clinicListCollectionView)
        NSLayoutConstraint.activate([
            clinicListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            clinicListCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            clinicListCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            clinicListCollectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
        print("view set up")
        print(clinic)
        clinicListCollectionView.reloadData()
        
    }
    

    func fetchClinics() async {
        do {
            self.clinic = try await retrieveClinics()
            for clinic in self.clinic {
                print(clinic)
            }
            setUpUI()
        } catch {
            print("Failed to fetch clinics: \(error)")
        }
    }


}
