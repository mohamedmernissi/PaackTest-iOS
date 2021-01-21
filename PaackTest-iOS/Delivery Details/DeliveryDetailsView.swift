//
//  DeliveryDetailsView.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// DeliveryDetails Module View
class DeliveryDetailsView: UIViewController {
    
    private var presenter: DeliveryDetailsPresenterProtocol!
    
    var deliveryEntity : DeliveryEntity?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DeliveryDetailsPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.

    }
    
}

// MARK: - extending DeliveryDetailsView to implement it's protocol
extension DeliveryDetailsView: DeliveryDetailsViewProtocol {
    
}
