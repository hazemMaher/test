//
//  ViewController.swift
//  PlanRadarAsessment
//
//  Created by Hazem Maher on 27.08.20.
//  Copyright © 2020 Hazem Ahmed. All rights reserved.
//

import UIKit
import RxSwift

final class CityListViewController: UIViewController {

    // MARK: - Properities
    
    @IBOutlet private var tableView: StateHandlerTableView!
    fileprivate var textField: UITextField!
    
    var cityViewModel: CityListViewModel!
    private var cities = [City]() {
        didSet {
//            tableView.reloadData()
        }
    }
    private let disposeBag = DisposeBag()
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBinding()
    }
    
    // MARK: - Setup Binding
    
    func setupBinding() {
        cityViewModel = CityListViewModel()
        let output = cityViewModel.output
        
        output.cites.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [unowned self] (cities) in
            self.cities = cities})
            .disposed(by: disposeBag)
        
        output.addCityResponse
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [unowned self] city in
            self.cities.append(city)})
            .disposed(by: disposeBag)
        
        output.deleteCityResponse
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [unowned self] bool in
                self.cities.removeFirst()
            })
            .disposed(by: disposeBag)

        cityViewModel.input.deleteCity.onNext("islam")
    }

    
    // MARK: - Actions
    
    @IBAction func AddCity(_ sender: Any) {
        self.showAlertTextField()
    }
    
    // MARK: - Helpers
    
    func showAlertTextField() {
        let alert = UIAlertController(title: "City Name", message: nil, preferredStyle: .alert)
        alert.addTextField { [unowned self] (textField) in
                textField.rx.controlEvent(.editingDidEnd)
                .bind { [unowned self]  in
                    self.cityViewModel.addCity.onNext(textField.text!)}
                    .disposed(by: self.disposeBag)
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

