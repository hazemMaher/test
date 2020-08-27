//
//  CityListViewModel.swift
//  PlanRadarAsessment
//
//  Created by islam Elshazly on 27/08/2020.
//  Copyright © 2020 Hazem Ahmed. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - Protocols
protocol CityListInputs {
    var refreshContent: AnyObserver<Void> { get }
    var addCity: AnyObserver<String> { get }
    var deleteCity: AnyObserver<String> { get }
}

protocol CityListOutputs {
    var cites: Observable<[City]> { get }
    var addCityResponse: Observable<City> { get }
    var deleteCityResponse: Observable<Bool> { get }
}

// MARK: - Class

final class CityListViewModel: CityListInputs, CityListOutputs {
    
    
    // MARK: - Inputs & Outputs
    
    var input: CityListInputs { return self }
    var output: CityListOutputs { return self }
    
    // MARK: - Inputs
    
    var refreshContent: AnyObserver<Void>
    var addCity: AnyObserver<String>
    var deleteCity: AnyObserver<String>
    
    // MARK: - Outputs
    
    var cites: Observable<[City]>
    var addCityResponse: Observable<City>
    var deleteCityResponse: Observable<Bool>
    
    // MARK: - Private Properties
    
    private var refreshContentProperty = BehaviorSubject<Void>(value: ())
    private var addCityProperty = PublishSubject<String>()
    private var deleteCityProperty = PublishSubject<String>()
    
    init() {
        refreshContent = refreshContentProperty.asObserver()
        cites = PublishSubject<[City]>().asObserver()
        addCity = addCityProperty.asObserver()
        addCityResponse = PublishSubject<City>().asObserver()
        deleteCity = deleteCityProperty.asObserver()
        deleteCityResponse = PublishSubject<Bool>().asObserver()
        cities()
        saveCity()
        deleteLocalCity()
    }
    
    func cities() {
        cites = refreshContentProperty.flatMapLatest { _ in
            return DatastoreManager.shared.fetchCities()
                .catchError({ error in
                    return Observable.empty() })}
    }
    
    
    func saveCity() {
        addCityResponse = addCityProperty.flatMapLatest { name in
            return DatastoreManager.shared.save(cityName: name)
                .catchError({ error in
            return Observable.empty() })}
    }
    
    func deleteLocalCity() {
        deleteCityResponse = deleteCityProperty.flatMapLatest { name in
            return DatastoreManager.shared.deleteCity(cityName: name)
                .catchError({ error in
            return Observable.empty() })}
    }
}
