//
//  LoadingView.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit
import SVProgressHUD

// MARK: - LoadingViewable

protocol LoadingViewable {
    func startLoadingIndicator()
    func stopLoadingIndicator()
}

// MARK: - LoadingViewable Default Implementation

extension LoadingViewable where Self: UIViewController {
    
    func startLoadingIndicator() {
        SVProgressHUD.show()
    }
    
    func stopLoadingIndicator() {
        SVProgressHUD.dismiss()
    }
}

// MARK: - UIViewController implements LoadingViewable

extension UIViewController: LoadingViewable {}
