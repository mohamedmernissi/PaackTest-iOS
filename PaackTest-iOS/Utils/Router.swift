//
//  Router.swift
//  PaackTest-iOS
//
//  Created by mohamedmernissi on 1/20/21.
//

import Foundation
import UIKit
class Router {
    static func setRootVC()
    {
        let deliveriesListView = DeliveriesListView()
        let navigationController = UINavigationController(rootViewController: deliveriesListView)
        if let window = UIApplication.shared.keyWindow {
            window.rootViewController = navigationController
        }
    }
}
