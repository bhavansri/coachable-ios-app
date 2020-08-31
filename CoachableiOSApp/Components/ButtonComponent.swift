//
//  ButtonComponent.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-16.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import Foundation
import UIKit

enum ButtonSize {
    case small
    case large
    
    var height: CGFloat {
        switch self {
        case .small:
            return 30
        case .large:
            return 60
        }
    }
    
    var width: CGFloat {
        switch self {
        case .small:
            return 150
        case .large:
            return 200
        }
    }
}

final class ButtonComponent: UIButton {
    
    init(title: String, color: UIColor, size: ButtonSize) {
        self.title = title
        self.color = color
        self.size = size
        
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        self.tintColor = .white
        self.layer.cornerRadius = 3
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    
    private let title: String
    private let color: UIColor

    private let size: ButtonSize
}
