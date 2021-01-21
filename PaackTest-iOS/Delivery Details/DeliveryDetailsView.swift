//
//  DeliveryDetailsView.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import MapKit

/// DeliveryDetails Module View
class DeliveryDetailsView: UIViewController {
    
    // MARK:  Variabes
    
    private var presenter: DeliveryDetailsPresenterProtocol!
    
    var deliveryEntity : DeliveryEntity?
    
    // MARK:  IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblInstructions: UILabel!
    @IBOutlet weak var lblRequireSignature: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    // MARK:  View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DeliveryDetailsPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        if let deliveryId = self.deliveryEntity?.id{
            self.presenter.getDelivery(by: deliveryId)
        }else{
            self.didFailToGetDelivery(error: StringsConstants.ErrorMessageWs)
        }
        self.title = "Details"
    }
    
    // MARK:  Setup
    
    func setupInfo(with object : DeliveryEntity){
        lblName.text = object.customerName
        lblAddress.text = object.address
        lblInstructions.text = object.specialInstructions
        let requireSignature = object.requiresSignature ?? false
        lblRequireSignature.text = requireSignature ? "true" : "false"
        if let latitude = object.latitude, let longitude = object.longitude{
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            annotation.coordinate = coordinate
            mapView.setRegion(region, animated: true)
            mapView.addAnnotation(annotation)
        }
        else{
            self.mapView.isHidden = true
        }
    }
    
    // MARK:  IBActions
    @IBAction func didMakeItActive(_ sender: UISwitch) {
        
    }
    
}

// MARK: - extending DeliveryDetailsView to implement it's protocol
extension DeliveryDetailsView: DeliveryDetailsViewProtocol {
    func didGetDeliverySuccessfully(object: DeliveryEntity) {
        self.setupInfo(with: object)
    }
    
    func didFailToGetDelivery(error: String) {
        self.showAlert(message: error)
    }
}
