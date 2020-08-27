//
//  WeatherInfo+CoreDataProperties.swift
//  
//
//  Created by islam Elshazly on 27/08/2020.
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
