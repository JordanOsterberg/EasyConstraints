//
//  UIView+Constraints.swift
//  EasyConstraints
//
//  Created by Jordan Osterberg on 1/10/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import UIKit

extension UIView {
    
    
    /// Center the view horizontally in another view
    ///
    /// - Parameters:
    ///   - view: The view you want to center this view in
    ///   - active: If you want to activate this constraint
    /// - Returns: The created constraint
    @discardableResult
    func centerHorizontally(in view: UIView, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func centerVertically(in view: UIView, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func equalWidth(to view: UIView, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.widthAnchor.constraint(equalTo: view.widthAnchor)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func equalHeight(to view: UIView, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.heightAnchor.constraint(equalTo: view.heightAnchor)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func setHeight(equalTo constant: CGFloat, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func setWidth(equalTo constant: CGFloat, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.widthAnchor.constraint(equalToConstant: constant)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func placeBelow(view: UIView, distance: CGFloat = 0, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: distance)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func placeAbove(view: UIView, distance: CGFloat = 0, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: distance)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func placeRightOf(view: UIView, distance: CGFloat = 0, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: distance)
        return handle(constraint: constraint, active: active)
    }
    
    @discardableResult
    func placeLeftOf(view: UIView, distance: CGFloat = 0, active: Bool = true) -> NSLayoutConstraint? {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: distance)
        return handle(constraint: constraint, active: active)
    }
    
    private func handle(constraint: NSLayoutConstraint, active: Bool) -> NSLayoutConstraint? {
        if active {
            constraint.isActive = true
        }
        
        return constraint
    }
    
}
