//
//  ClinicListCollectionView.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 27/06/25.
//

import UIKit

class ClinicListCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var clinics: [Clinic] = [Clinic]()
    private let clinicListCollectionView: UICollectionView
    
    init(clinics: [Clinic]) {
        self.clinics = clinics
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        self.clinicListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        clinicListCollectionView.delegate = self
        clinicListCollectionView.dataSource = self
        clinicListCollectionView.register(ClinicListCollectionViewCell.self, forCellWithReuseIdentifier: ClinicListCollectionViewCell.identifier)
        clinicListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        clinicListCollectionView.layer.cornerRadius = 10
        clinicListCollectionView.numberOfItems(inSection: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clinics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = clinicListCollectionView.dequeueReusableCell(withReuseIdentifier: ClinicListCollectionViewCell.identifier, for: indexPath) as? ClinicListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let clinic = clinics[indexPath.item]
        cell.configure(with: clinic)
        
        return cell
    }

}
