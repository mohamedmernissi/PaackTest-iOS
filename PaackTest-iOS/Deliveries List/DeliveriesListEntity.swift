//
//  DeliveriesListEntity.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// DeliveriesList Module Entity

struct DeliveryEntity: Codable {
    let id: Int?
    let address: String?
    let latitude, longitude: Double?
    let customerName: String?

    enum CodingKeys: String, CodingKey {
        case id, address, latitude, longitude
        case customerName = "customer_name"
    }
}

typealias DeliveriesListResponse = [DeliveryEntity]
