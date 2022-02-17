//
//  ViewController.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var selectedDate : UILabel!
    @IBOutlet weak var tmpLbl : UILabel!
    @IBOutlet weak var weatherMainLbl : UILabel!
    @IBOutlet weak var humidityLbl : UILabel!
    
    let disposeBag = DisposeBag()
    private var viewModel : WeatherListViewModel!
    
    
    static func instantiateView(viewModel: WeatherListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getWeatherVideModels().bind(to: tableView.rx.items(cellIdentifier: "DailyCell", cellType: DailyCell.self)) { index, viewModelObj, cell in
            
                if (index == 0) {
                    self.populateData(viewModel: viewModelObj)
                }
                
                viewModelObj.displayDate.asDriver(onErrorJustReturn: "")
                .drive(cell.dateLbl.rx.text)
                .disposed(by: self.disposeBag)
            
                viewModelObj.mainWeather.asDriver(onErrorJustReturn: "")
                .drive(cell.mainWeather.rx.text)
                .disposed(by: self.disposeBag)
            
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(WeatherViewModel.self).subscribe(onNext: {
            viewModelObj in
                self.populateData(viewModel: viewModelObj)
        }).disposed(by: disposeBag)
    }
    
    func populateData(viewModel : WeatherViewModel) {
        
        viewModel.displayDate.asDriver(onErrorJustReturn: "")
        .drive(selectedDate.rx.text)
        .disposed(by: self.disposeBag)
        
        viewModel.temperature.asDriver(onErrorJustReturn: "")
        .drive(tmpLbl.rx.text)
        .disposed(by: self.disposeBag)
        
        viewModel.descriptionWeather.asDriver(onErrorJustReturn: "")
        .drive(weatherMainLbl.rx.text)
        .disposed(by: self.disposeBag)
        
        viewModel.humidity.asDriver(onErrorJustReturn: "")
        .drive(humidityLbl.rx.text)
        .disposed(by: self.disposeBag)
        
    }


}

