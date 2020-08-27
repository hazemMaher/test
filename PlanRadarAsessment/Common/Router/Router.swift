//
//  Router.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit

@objc protocol Router {
    func setRoot(presentable: UIViewController?, hideBar: Bool)
    func popToRoot(animated: Bool)
    func present(presentable: UIViewController?, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func push(presentable: UIViewController?, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    typealias CompletionHandler = (() -> Void)
}
