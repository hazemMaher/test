//
//  WeatherInfo+CoreDataProperties.swift
//  PlanRadarAsessment
//
//  Created by Hazem Maher on 27.08.20.
//  Copyright © 2020 Hazem Ahmed. All rights reserved.
//
//

import Foundation
import CoreData


extension WeatherInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherInfo> {
        return NSFetchRequest<WeatherInfo>(entityName: "WeatherInfo")
    }

    @NSManaged public var cityDescription: String?
    @NSManaged public var humidity: Int64
    @NSManaged public var iconID: String?
    @NSManaged public var temp: Float
    @NSManaged public var windSpeed: Float
    @NSManaged public var city: City?

}
