//
//  AlertView.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Show Alert
    
    func showAlert(error: Error) {
        self.showAlert(title: "OPS", string: error.localizedDescription)
    }
    
    func showAlert(title: String = "Info", string: String) {
        
        let alert = UIAlertController(title: title,
                                      message: string,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

