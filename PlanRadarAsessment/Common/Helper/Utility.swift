//
//  Utility.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit

class Utility {
    
    // MARK: - Setup
    
    class func setupAppAppearance() {
        
        UINavigationBar.appearance().barTintColor = C.themeColor
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let navigationBarFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
        let barButtonFont = UIFont.systemFont(ofSize: 16)
        UINavigationBar.appearance().titleTextAttributes = [.font: navigationBarFont,
                                                            .foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: barButtonFont], for: .normal)
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UILabel.appearance(whenContainedInInstancesOf: [UITextField.self]).textColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = #colorLiteral(red: 0.9403133096, green: 0.9403133096, blue: 0.9403133096, alpha: 1)
    }
}
