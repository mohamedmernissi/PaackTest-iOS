//
//  UIViewController + Extensions.swift
//  Extension
//
//  Created by mohamedmernissi on 27/05/2020.
//  Copyright © 2020 mohamedmernissi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    // Empty action to provide to a selector
    func noAction(){}
    
    func popupAlert(title: String?, message: String?,style : UIAlertController.Style = UIAlertController.Style.alert, actionTitles:[(title : String?,style : UIAlertAction.Style)], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for (index, action) in actionTitles.enumerated() {
            let action = UIAlertAction(title: action.title, style: action.style, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message : String,action : ((UIAlertAction) -> Void)? = nil){
        self.popupAlert(title: nil, message: message, actionTitles: [("Close",.default)], actions: [action])
    }
    
    func present(controller: UIViewController, modalPresentationStyle: UIModalPresentationStyle = .fullScreen,animated : Bool = true) {
        controller.modalPresentationStyle = modalPresentationStyle
        self.present(controller, animated: animated, completion: nil)
    }
    
    func push(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
