//
//  WeatherResource.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

//This class resposible for communicate with HttpUtility and send response to View Model. Instead of writting all business login in View Model class, I have seprate the resposiblities from View Model class.

import Foundation
import RxSwift

protocol WeatherResourceProtocol {
    func getWatherDailyData() -> Observable<[Daily]>
}

class WeatherResource : WeatherResourceProtocol {
    func getWatherDailyData() -> Observable<[Daily]> {
        return Observable.create { observer -> Disposable in
            
            do {
                let urlStr = APILinks.instance.getGetWeatherDataURL()
                let serviceUrl = URL(string: urlStr)
                HttpUtility.instance.getData(url: serviceUrl!, resultType: WeatherResponse.self) { result in
                    if let resultData = result {
                        observer.onNext(resultData.daily)
                    }
                }
            }
            
            return Disposables.create { }
            
        }
    }
    
    
}
