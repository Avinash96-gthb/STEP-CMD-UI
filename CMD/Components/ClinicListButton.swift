//
//  ClinicListButton.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 25/06/25.
//

import UIKit

class ClinicListButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeButton()
    }

    private func initializeButton() {
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .systemPink
        self.layer.cornerRadius = 8
    }
    
    public func setTitle(title: String){
        self.setTitle(title, for: .normal)
    }
}

