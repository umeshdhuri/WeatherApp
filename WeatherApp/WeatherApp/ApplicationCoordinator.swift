//
//  ApplicationCoordinator.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

import Foundation
import UIKit

class ApplicationCoordinator {
    
    private let window : UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func startApp() {
        let viewController = ViewController.instantiateView(viewModel: WeatherListViewModel())
        let navController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
}
