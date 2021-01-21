//
//  Extensions.swift
//  PaackTest-iOS
//
//  Created by mohamed mernissi on 1/20/21.
//

import Foundation
import UIKit

extension Error {
    var errorMessage : String {
        let error = self as NSError
        return error.domain
    }
}

extension UIApplication {
    var keyWindow: UIWindow? {
        get {
            if #available(iOS 13.0, *) {
                return  UIApplication.shared.delegate?.window ?? nil
            } else {
                return UIApplication.shared.delegate?.window ?? nil
            }
        }
    }
}
