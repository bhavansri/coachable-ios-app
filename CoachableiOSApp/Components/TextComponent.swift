//
//  TextComponent.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-16.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import Foundation
import UIKit

final class TextComponent: UILabel {
    
    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.text = title
        self.textColor = color
        self.textAlignment = .center
    }
    
    private let title: String
    private let color: UIColor
    
}
