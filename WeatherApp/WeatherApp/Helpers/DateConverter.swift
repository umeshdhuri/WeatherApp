//
//  DateConverter.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

//This is an helper class I have created for Date related functionality

import Foundation

struct DateConverter {
    func FormatDateToString(dateTimeVal : Int) -> String {
        let dateTime = TimeInterval(dateTimeVal)
        let myDate = NSDate(timeIntervalSince1970: dateTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM"
        let deateStr = dateFormatter.string(from: myDate as Date)
        return deateStr
    }
}
