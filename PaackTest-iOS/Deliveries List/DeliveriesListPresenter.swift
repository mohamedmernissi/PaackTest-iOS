//
//  DeliveriesListPresenter.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// DeliveriesList Module Presenter
class DeliveriesListPresenter {
    
    // MARK:  Variables

    weak private var _view: DeliveriesListViewProtocol?
    private var interactor: DeliveriesListInteractorProtocol
    private var wireframe: DeliveriesListRouterProtocol
    private var deliveriesList = [DeliveryEntity]()
    
    init(view: DeliveriesListViewProtocol) {
        self._view = view
        self.interactor = DeliveriesListInteractor()
        self.wireframe = DeliveriesListRouter()
    }
}

// MARK: - extending DeliveriesListPresenter to implement it's protocol
extension DeliveriesListPresenter: DeliveriesListPresenterProtocol {
    func numberOfRows() -> Int {
        return self.deliveriesList.count
    }
    
    func getDelivery(index: Int) -> DeliveryEntity? {
        return self.deliveriesList[index]
    }
    
    func getDeliveries() {
        self.interactor.getDeliveries().done { (data) in
            self.deliveriesList = data
            self._view?.didGetDeliveriesSuccessfully()
        }.catch { (error) in
            self._view?.didFailToGetDeliveries(error: error.errorMessage)
        }
    }
    
    func showDetailsFor(object: DeliveryEntity, parentViewController viewController: UIViewController) {
        self.wireframe.showDetailsFor(object: object, parentViewController: viewController)
    }
}
