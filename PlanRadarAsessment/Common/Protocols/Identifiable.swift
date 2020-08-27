//
//  Identifiable.swift
//  RepoSearcher
//
//  Created by Hazem Maher on 29/06/2019.
//  Copyright © 2019 Hazem. All rights reserved.
//

import UIKit

// MARK: - Identifiable

protocol Identifiable {
    static var identifier: String { get }
}

// MARK: - Identifiable Default implementation

extension Identifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
