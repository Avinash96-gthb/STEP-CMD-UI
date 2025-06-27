//
//  ClinicListCollectionViewCell.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 27/06/25.
//

import UIKit

class ClinicListCollectionViewCell: UICollectionViewCell {
    static let identifier = "Clinic List Cell"
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = label.font.withSize(30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
    }
    
    func configure(with clinic: Clinic){
        titleLabel.text = clinic.name
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for service in clinic.services {
            let serviceLabel = UILabel()
            serviceLabel.text = service.name
            serviceLabel.font = serviceLabel.font.withSize(10)
            serviceLabel.textColor = .gray
            stackView.addArrangedSubview(serviceLabel)
        }
    }
}
