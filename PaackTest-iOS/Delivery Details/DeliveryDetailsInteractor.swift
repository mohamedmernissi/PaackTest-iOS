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
    
    func postData(trackingObject: TrackingObject) -> Promise<APIResponse> {
        let parameters : [String : Any] = ["driver_id":trackingObject.driverID!,"tracking_data":trackingObject.trackingData!]
        let url = URLConstants.tracking
        return AF.request(url,method: .post,parameters: parameters, encoding: URLEncoding.default)
        .debugLog()
        .validate()
        .responseCodable()
    }
}
