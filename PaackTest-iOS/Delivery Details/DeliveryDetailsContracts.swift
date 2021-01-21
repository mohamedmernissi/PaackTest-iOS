//
//  DeliveryDetailsContracts.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import PromiseKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// DeliveryDetails Module View Protocol
protocol DeliveryDetailsViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type DeliveryDetailsEntity
    func didGetDeliverySuccessfully(object : DeliveryEntity)
    func didFailToGetDelivery(error : String)
}

//MARK: Interactor -
/// DeliveryDetails Module Interactor Protocol
protocol DeliveryDetailsInteractorProtocol {
    // Fetch Object from API
    func getDelivery(by id : Int) -> Promise<DeliveryEntity>
}

//MARK: Presenter -
/// DeliveryDetails Module Presenter Protocol
protocol DeliveryDetailsPresenterProtocol {
    func getDelivery(by id : Int)
}

//MARK: Router (aka: Wireframe) -
/// DeliveryDetails Module Router Protocol
protocol DeliveryDetailsRouterProtocol {
}
