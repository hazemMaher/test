//
//  CityListDataStore.swift
//  PlanRadarAsessment
//
//  Created by islam Elshazly on 27/08/2020.
//  Copyright © 2020 Hazem Ahmed. All rights reserved.
//

import Foundation
import CoreData
import RxSwift

class DatastoreManager {
    
    public static var shared: DatastoreManager! = nil
    
    var managedContext: NSManagedObjectContext
    
    private init(context: NSManagedObjectContext) {
        self.managedContext = context
    }
    
    public class func shared(context: NSManagedObjectContext) {
        if (self.shared == nil) {
            self.shared = DatastoreManager(context: context)
            self.shared.managedContext = context
        }
    }
    
    public func save(cityName name: String) -> Observable<City> {
        return Observable.create({ [unowned self] observable in
            
            
            
            // Create Entity
            let entity = NSEntityDescription.entity(forEntityName: "City", in: self.managedContext)
            
            // Initialize Record
            let record = City(entity: entity!, insertInto: self.managedContext)
            record.name = name
            self.managedContext.performAndWait {
                do {
                    try self.managedContext.save()
                    observable.onNext(record)
                } catch let error as NSError {
                    print("could not save, managedobject \(error), \(error.userInfo)")
                    return observable.onError(error)
                }
            }
            return Disposables.create {}
        })
    }
    
    public func fetchCities() -> Observable<[City]> {
        let request: NSFetchRequest<City> = City.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result {
                print(data)
            }
            return Observable.just(result)
        } catch {
            print("fetch request failed, managedobject")
            return Observable.empty()
        }
    }
    
    public func deleteCity(cityName name: String) -> Observable<Bool>{
        let request: NSFetchRequest<City> = City.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let cities = try managedContext.fetch(request)
            for city in cities {
                if city.name == name {
                    managedContext.delete(city)
                    break
                }
            }
            return Observable.just(true)
        } catch {
            print("fetch request failed, managedobject")
            return Observable.just(false)
        }
    }
    
}
