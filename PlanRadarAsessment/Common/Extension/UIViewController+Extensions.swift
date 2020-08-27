//
//  UIViewController+Extensions.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit

// MARK: - StoryboardInitializable

protocol StoryboardInitializable: Identifiable {
    static func initFromStoryboard(storyboard: C.Storyboard) -> Self
}

// MARK: - StoryboardInitializable Default Implementation

extension StoryboardInitializable where Self: UIViewController {
    
    static func initFromStoryboard(storyboard: C.Storyboard) -> Self {
        
        let storyboard = UIStoryboard(name: storyboard.name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

// MARK: - UIViewController Implements StoryboardInitializable

extension UIViewController: StoryboardInitializable {}
