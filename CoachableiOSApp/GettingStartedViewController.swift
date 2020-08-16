//
//  ViewController.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-16.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import UIKit

final class GettingStartedViewController: UIViewController {

   override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        let titleLabel = TextComponent(title: "Lets get started!", color: .black)
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(ButtonComponent(
            title: "Beginner",
            color: .black,
            size: .small))
        stackView.addArrangedSubview(ButtonComponent(
            title: "Intermediate",
            color: .blue,
            size: .small))
        stackView.axis = .vertical
        stackView.spacing = 25
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(stackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}

