//
//  UIView+Ext.swift
//  AssessmentDemo
//
//  Created by Samrudhi Santaji on 22/11/21.
//

import UIKit
// MARK: - UIView extension
extension UIView {
    // adding the view contraints, pinning it to superview
    func pin(to superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}
