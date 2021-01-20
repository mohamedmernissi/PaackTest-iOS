//
//  Constants.swift
//  PaackTest-iOS
//
//  Created by mohamed mernissi on 1/20/21.
//

import Foundation

struct URLConstants {
    private struct Domains {
        static let BASEURL = "https://my-json-server.typicode.com/mohamedmernissi/PaackTest-iOS/"
    }
    
    static var getDeliveries: String {
        return Domains.BASEURL + "deliveries"
    }
}
