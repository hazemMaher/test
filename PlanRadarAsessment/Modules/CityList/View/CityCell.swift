//
//  CityCell.swift
//  PlanRadarAsessment
//
//  Created by islam Elshazly on 27/08/2020.
//  Copyright © 2020 Hazem Ahmed. All rights reserved.
//

import UIKit

final class CityCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLable: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configuareCell(city: City) {
        nameLable.text = city.name
    }
}
