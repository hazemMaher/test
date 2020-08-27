//
//  StoryboardConstants.swift
//  FreeNowTask
//
//  Created by Hazem Maher on 10/07/2019.
//  Copyright © 2019 Hazem. All rights reserved.
//

extension C {
    enum Storyboard: String {
        case weather
        
        var name: String {
            return self.rawValue.capitalized
        }
    }
}
