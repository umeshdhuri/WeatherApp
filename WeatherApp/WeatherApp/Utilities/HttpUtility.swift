//
//  HttpUtility.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//


//This is an HttpUtility class created for write Get, POST, Delete etc API calls. All methods will be Generic and can be use for any API calls. Below I have creted method for GET HTTP API call's and it can be use for all GET API calls. Same we need to create for POST, Delete etc based on requirement. For this demo I am only using GET HTTP calls.



import Foundation

final class HttpUtility {
    static let instance = HttpUtility()
    
    func getData<T:Decodable>(url : URL, resultType : T.Type, completionHandler:@escaping(_ result : T?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
}
