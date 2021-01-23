//
//  Extensions.swift
//  PaackTest-iOS
//
//  Created by mohamed mernissi on 1/20/21.
//

import Foundation
import UIKit

extension TimeInterval {
    private var milliseconds: Int {
        return Int((truncatingRemainder(dividingBy: 1)) * 1000)
    }

    var seconds: Int {
        return Int(self) % 60
    }

    private var minutes: Int {
        return (Int(self) / 60 ) % 60
    }

    private var hours: Int {
        return Int(self) / 3600
    }

    var stringTime: String {
        if hours != 0 {
            return "\(hours)h \(minutes)m \(seconds)s"
        } else if minutes != 0 {
            return "\(minutes)m \(seconds)s"
        } else if milliseconds != 0 {
            return "\(seconds)s \(milliseconds)ms"
        } else {
            return "\(seconds)s"
        }
    }
}

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
