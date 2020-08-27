//
//  UITableView+Extensions.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit

extension UITableViewCell: Identifiable { }
extension UITableViewHeaderFooterView: Identifiable { }

extension UITableView {
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(UINib(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(aClass: T.Type) {
        register(UINib(nibName: T.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func dequeueResuableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError(" Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue header/footer view with identifier: \(T.identifier)")
        }
        return view
    }
    
    func deselectSelectedRow() {
        if let indexPath = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPath, animated: true)
        }
    }
}
