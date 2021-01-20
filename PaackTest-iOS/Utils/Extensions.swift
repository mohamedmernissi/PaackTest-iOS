//
//  Extensions.swift
//  PaackTest-iOS
//
//  Created by mohamed mernissi on 1/20/21.
//

import Foundation

extension Error {
    var errorMessage : String {
        let error = self as NSError
        return error.domain
    }
}
