//
//  DeliveriesListInteractor.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import PromiseKit
import Alamofire

/// DeliveriesList Module Interactor
class DeliveriesListInteractor: DeliveriesListInteractorProtocol {
    func getDeliveries() -> Promise<DeliveriesListResponse> {
        let url = URLConstants.getDeliveries
        return AF.request(url,method: .get,parameters: nil, encoding: URLEncoding.default)
        .debugLog()
        .validate()
        .responseCodable()
    }
}
