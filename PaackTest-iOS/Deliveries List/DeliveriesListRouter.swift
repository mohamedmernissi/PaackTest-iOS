//
//  DeliveriesListRouter.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// DeliveriesList Module Router (aka: Wireframe)
class DeliveriesListRouter: DeliveriesListRouterProtocol {
    func showDetailsFor(object: DeliveryEntity, parentViewController viewController: UIViewController) {
        let deliveryDetails = DeliveryDetailsView()
        deliveryDetails.deliveryEntity = object
        viewController.push(deliveryDetails)
    }
}
