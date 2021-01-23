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
    func getDelivery(by id: Int) {
        self.interactor.getDelivery(by: id).done { (data) in
            self._view?.didGetDeliverySuccessfully(object: data)
        }.catch { (error) in
            self._view?.didFailToGetDelivery(error: error.errorMessage)
        }
    }
    
    func postData(trackingObject: TrackingObject) {
        self.interactor.postData(trackingObject: trackingObject).done { (data) in
            self._view?.didPostDataSuccessfully()
        }.catch { (error) in
            self._view?.didFailToPostData(error: error.errorMessage)
        }
    }
    
    func getElapsedTime(date : Date?) -> Int {
        // get time intercal from start date to current date
        guard let timeInterval = date?.timeIntervalSinceNow else { return 0 }
        // convert to Integer
        let timeIntervalInt = -(Int(timeInterval))
        return timeIntervalInt
    }
}
