//
//  DeliveryDetailsView.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

/// DeliveryDetails Module View
class DeliveryDetailsView: UIViewController {
    
    // MARK:  Variabes
    
    private var presenter: DeliveryDetailsPresenterProtocol!
    
    var deliveryEntity : DeliveryEntity?
    
    private var locationManager : CLLocationManager?
    
    private var batteryLevel: Int {
        let batteryLevel = UIDevice.current.batteryLevel * 100
        return Int(batteryLevel)
    }
    
    private var trackingObject : TrackingObject?
    private var trackingDataArray = [TrackingData]()

    
    private var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    private var startDate: Date?
   
    //Hardcoded value for driver id since there's no user data
    private var driverId = Int.random(in: 0...99)

    
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
            // Add pin on map to show the delivery address on the map
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
        if sender.isOn{
            // start tracking the driver using corelocation functionnalities
            self.startTracking()
        }
        else{
            locationManager = nil
            self.clearData()
        }
    }
    
    func startTracking(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.allowsBackgroundLocationUpdates = true
            locationManager?.pausesLocationUpdatesAutomatically = false
            locationManager?.activityType = .automotiveNavigation
            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager?.requestAlwaysAuthorization()
            locationManager?.requestWhenInUseAuthorization()
            locationManager?.startUpdatingLocation()
            locationManager?.distanceFilter = 5
        }
        else{
            self.showAlert(message: "Please enable location!")
        }
    }
    
    func clearData(){
        // clear old data after posting tracking data to the server
        self.trackingDataArray.removeAll()
        self.startDate = nil
    }
    
}

// MARK: - extending DeliveryDetailsView to implement it's protocol
extension DeliveryDetailsView: DeliveryDetailsViewProtocol {
    func didPostDataSuccessfully() {
        self.clearData()
    }
    
    func didFailToPostData(error: String) {
        self.clearData()
    }
    
    func didGetDeliverySuccessfully(object: DeliveryEntity) {
        self.setupInfo(with: object)
    }
    
    func didFailToGetDelivery(error: String) {
        self.showAlert(message: error)
    }
}

extension DeliveryDetailsView : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = Double((manager.location?.coordinate.latitude)!)
        let lon = Double((manager.location?.coordinate.longitude)!)
        
        if startDate == nil{
            startDate = Date()
        }
        
        // timestamp for the collected data
        guard let timeStamp = startDate?.timeIntervalSince1970 else { return }
        let timeStampInt = Int(timeStamp)
        
        let trackingData = TrackingData(latitude: lat, longitude: lon, deliveryID: self.deliveryEntity?.id!, batteryLevel: batteryLevel, timestamp: timeStampInt)
        
        trackingDataArray.append(trackingData)
        let elapsedTime = self.presenter.getElapsedTime(date: startDate)
        print("timeInterval: ",elapsedTime)

        //if 10 seconds is elapsed, the data is posted and the counter is reset
        if elapsedTime >= 10{
            let trackingObject = TrackingObject(driverID: self.driverId, trackingData: trackingDataArray)
            self.presenter.postData(trackingObject: trackingObject)
        }

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if (error as? CLError)?.code == .denied {
            manager.stopUpdatingLocation()
            manager.stopMonitoringSignificantLocationChanges()
        }
    }
}
