//
//  DeliveryDetailsInteractor.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import PromiseKit
import Alamofire

/// DeliveryDetails Module Interactor
class DeliveryDetailsInteractor: DeliveryDetailsInteractorProtocol {
    func getDelivery(by id: Int) -> Promise<DeliveryEntity> {
        let url = URLConstants.getDeliveries + "/\(id)"
        return AF.request(url,method: .get,parameters: nil, encoding: URLEncoding.default)
        .debugLog()
        .validate()
        .responseCodable()
    }
}
