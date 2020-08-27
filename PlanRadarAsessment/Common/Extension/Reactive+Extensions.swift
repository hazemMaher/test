//
//  Reactive+Extensions.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    
    var isLoading: Binder<Bool> {
        
        return Binder(self.base, binding: { (vc, flag) in
            if flag {
                vc.startLoadingIndicator()
            } else {
                vc.stopLoadingIndicator()
            }
        })
    }
    
    var showAlert: Binder<Error> {
        
        return Binder(self.base, binding: { (vc, error) in
            vc.showAlert(error: error)
        })
    }
}
