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
    let latitude: Double?
    let longitude: Double?
    let customerName: String?
    let requiresSignature: Bool?
    let specialInstructions: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case address = "address"
        case latitude = "latitude"
        case longitude = "longitude"
        case customerName = "customer_name"
        case requiresSignature = "requires_signature"
        case specialInstructions = "special_instructions"
    }
}

typealias DeliveriesListResponse = [DeliveryEntity]
