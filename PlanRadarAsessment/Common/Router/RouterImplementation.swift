//
//  RouterImpl.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit

final class RouterImplementation: Router {
    
    // MARK: - Properties
    
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController: CompletionHandler]
    
    // MARK: - Init
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        self.completions = [:]
    }
    
    // MARK: - Router
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func setRoot(presentable: UIViewController?, hideBar: Bool) {
        guard let controller = presentable else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRoot(animated: Bool) {
        guard let controllers = rootController?.popToRootViewController(animated: animated) else {
            return
        }
        controllers.forEach { runCompletion(controller: $0) }
    }
    
    func present(presentable: UIViewController?, animated: Bool) {
        guard let controller = presentable else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func push(presentable: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        guard let controller = presentable, (controller as? UINavigationController) == nil else {
            return
        }
        if let completion = completion {
            completions[controller] = completion
        }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func pop(animated: Bool) {
        guard let controller = rootController?.popViewController(animated: animated) else {
            return
        }
        runCompletion(controller: controller)
    }
    
    // MARK: - Private Helpers
    
    private func runCompletion(controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
}
