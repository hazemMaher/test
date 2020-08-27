//
//  City+CoreDataProperties.swift
//  
//
//  Created by islam Elshazly on 27/08/2020.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var name: String?
    @NSManaged public var weatherList: NSOrderedSet?

}

// MARK: Generated accessors for weatherList
extension City {

    @objc(insertObject:inWeatherListAtIndex:)
    @NSManaged public func insertIntoWeatherList(_ value: WeatherInfo, at idx: Int)

    @objc(removeObjectFromWeatherListAtIndex:)
    @NSManaged public func removeFromWeatherList(at idx: Int)

    @objc(insertWeatherList:atIndexes:)
    @NSManaged public func insertIntoWeatherList(_ values: [WeatherInfo], at indexes: NSIndexSet)

    @objc(removeWeatherListAtIndexes:)
    @NSManaged public func removeFromWeatherList(at indexes: NSIndexSet)

    @objc(replaceObjectInWeatherListAtIndex:withObject:)
    @NSManaged public func replaceWeatherList(at idx: Int, with value: WeatherInfo)

    @objc(replaceWeatherListAtIndexes:withWeatherList:)
    @NSManaged public func replaceWeatherList(at indexes: NSIndexSet, with values: [WeatherInfo])

    @objc(addWeatherListObject:)
    @NSManaged public func addToWeatherList(_ value: WeatherInfo)

    @objc(removeWeatherListObject:)
    @NSManaged public func removeFromWeatherList(_ value: WeatherInfo)

    @objc(addWeatherList:)
    @NSManaged public func addToWeatherList(_ values: NSOrderedSet)

    @objc(removeWeatherList:)
    @NSManaged public func removeFromWeatherList(_ values: NSOrderedSet)

}
