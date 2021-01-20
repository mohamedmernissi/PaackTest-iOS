//
//  DeliveriesListContracts.swift
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
/// DeliveriesList Module View Protocol
protocol DeliveriesListViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type DeliveriesListEntity
    func didGetDeliveriesSuccessfully()
    func didFailToGetDeliveries(error : String)
}

//MARK: Interactor -
/// DeliveriesList Module Interactor Protocol
protocol DeliveriesListInteractorProtocol {
    // Fetch Object from API
    func getDeliveries() -> Promise<DeliveriesListResponse>
}

//MARK: Presenter -
/// DeliveriesList Module Presenter Protocol
protocol DeliveriesListPresenterProtocol {
    func getDeliveries()
    func numberOfRows() -> Int
    func getDelivery(index : Int) -> DeliveryEntity?
}

//MARK: Router (aka: Wireframe) -
/// DeliveriesList Module Router Protocol
protocol DeliveriesListRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
     func showDetailsFor(object: DeliveryEntity, parentViewController viewController: UIViewController)
}
