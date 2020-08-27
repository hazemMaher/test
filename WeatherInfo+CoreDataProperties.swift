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

    @NSManaged public var city_description: String?
    @NSManaged public var humidity: Int64
    @NSManaged public var icon_id: Int64
    @NSManaged public var temp: Int64
    @NSManaged public var winnd_speed: Int64
    @NSManaged public var city: City?

}
