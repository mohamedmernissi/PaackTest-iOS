//
//  DeliveryDetailsEntity.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - TrackingObject
struct TrackingObject: Codable {
    let driverID: Int?
    let trackingData: [TrackingData]?

    enum CodingKeys: String, CodingKey {
        case driverID = "id"
        case trackingData = "tracking_data"
    }
}

// MARK: - TrackingData
struct TrackingData: Codable {
    let latitude, longitude: Double?
    let deliveryID, batteryLevel, timestamp: Int?

    enum CodingKeys: String, CodingKey {
        case latitude = "Latitude"
        case longitude
        case deliveryID = "delivery_id"
        case batteryLevel = "battery_level"
        case timestamp
    }
}

// MARK: - APIResponse
struct APIResponse: Codable {
    let status: String?
}
