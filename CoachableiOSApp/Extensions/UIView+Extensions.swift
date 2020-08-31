//
//  UIView+Extensions.swift
//  CoachableiOSApp
//
//  Created by Bhavan Srinathan on 2020-08-30.
//  Copyright © 2020 Bhavan Srinathan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(inside container: UIView, with insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), isToSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        let layoutContainer: Constrainable = isToSafeArea ? container.safeAreaLayoutGuide : container
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: layoutContainer.leadingAnchor, constant: insets.left),
            self.trailingAnchor.constraint(equalTo: layoutContainer.trailingAnchor, constant: -insets.right),
            self.topAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: insets.top),
            self.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor, constant: -insets.bottom)
        ])
    }
}

protocol Constrainable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var heightAnchor: NSLayoutDimension { get }
    var widthAnchor: NSLayoutDimension { get }
}

extension UIView: Constrainable {}
extension UILayoutGuide: Constrainable {}
