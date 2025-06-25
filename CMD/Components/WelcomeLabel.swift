//
//  WelcomeLabel.swift
//  CMD
//
//  Created by A Avinash Chidambaram on 25/06/25.
//
import UIKit

class WelcomeLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeLabel(){
        self.textAlignment = .center
        self.textColor = .black
        self.text = "Welcome to CMD, Click below to view all clinics or create a new one"
        self.font = UIFont(name: "Helvetica", size: 17)
        self.numberOfLines = 0
        
    }
    
}
