//
//  DeliveryDetailsPresenter.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// DeliveryDetails Module Presenter
class DeliveryDetailsPresenter {
    
    weak private var _view: DeliveryDetailsViewProtocol?
    private var interactor: DeliveryDetailsInteractorProtocol
    private var wireframe: DeliveryDetailsRouterProtocol
    
    init(view: DeliveryDetailsViewProtocol) {
        self._view = view
        self.interactor = DeliveryDetailsInteractor()
        self.wireframe = DeliveryDetailsRouter()
    }
}

// MARK: - extending DeliveryDetailsPresenter to implement it's protocol
extension DeliveryDetailsPresenter: DeliveryDetailsPresenterProtocol {
    
}
