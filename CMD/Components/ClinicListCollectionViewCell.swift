//
//  ClinicListCollectionViewCell.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 27/06/25.
//

import UIKit

class ClinicListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ClinicListCell"
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 222/255.0, alpha: 1)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with clinic: Clinic) {
        titleLabel.text = clinic.name
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for service in clinic.services {
            let serviceLabel = UILabel()
            serviceLabel.text = service.name
            serviceLabel.font = .systemFont(ofSize: 10)
            serviceLabel.textColor = .darkGray
            stackView.addArrangedSubview(serviceLabel)
        }
    }
}
