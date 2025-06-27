//
//  ClinicListCollectionView.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 27/06/25.
//

import UIKit

class ClinicListCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var clinics: [Clinic] = [Clinic]()
    private let clinicListCollectionView: UICollectionView
    
    init(clinics: [Clinic]) {
        self.clinics = clinics
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        self.clinicListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: .zero)
        setUpView()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width, height: 80) // or use collectionView.bounds.width
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(clinicListCollectionView)
        clinicListCollectionView.delegate = self
        clinicListCollectionView.dataSource = self
        clinicListCollectionView.register(ClinicListCollectionViewCell.self, forCellWithReuseIdentifier: ClinicListCollectionViewCell.identifier)
        clinicListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        clinicListCollectionView.layer.cornerRadius = 10
        

        // ✅ ADD MISSING CONSTRAINTS
        NSLayoutConstraint.activate([
            clinicListCollectionView.topAnchor.constraint(equalTo: topAnchor),
            clinicListCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            clinicListCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            clinicListCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
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
    
    
    func reloadData() {
            clinicListCollectionView.reloadData()
        }

}
