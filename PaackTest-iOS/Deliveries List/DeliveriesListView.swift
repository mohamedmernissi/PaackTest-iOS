//
//  DeliveriesListView.swift
//  PaackTest-iOS
//
//  Created mohamed mernissi on 1/20/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// DeliveriesList Module View
class DeliveriesListView: UIViewController {
    
    // MARK:  Constants
    
    let DeliveryListCellIdentifier = "DeliveryListCell"
    
    // MARK:  Variables
    
    private var presenter: DeliveriesListPresenterProtocol!
    
    // MARK:  IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:  View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DeliveriesListPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        
        // Header title
        self.title = "Deliveries"
        
        self.setupTableView()
        
        // fetch deliveries
        self.presenter.getDeliveries()
        
    }
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: DeliveryListCellIdentifier, bundle: nil), forCellReuseIdentifier: DeliveryListCellIdentifier)
    }
    
}

// MARK: - extending DeliveriesListView to implement it's protocol
extension DeliveriesListView: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryListCellIdentifier, for: indexPath) as! DeliveryListCell
        if let delivery = self.presenter.getDelivery(index: indexPath.row){
            // setup cell with fetched object
            cell.setup(with: delivery)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let delivery = self.presenter.getDelivery(index: indexPath.row){
            // show details screen and passing object to use the id to get it's details
            self.presenter.showDetailsFor(object: delivery, parentViewController: self)
        }
    }
}

// MARK: - extending DeliveriesListView to implement it's protocol
extension DeliveriesListView: DeliveriesListViewProtocol {
    func didGetDeliveriesSuccessfully() {
        self.tableView.reloadData()
    }
    
    func didFailToGetDeliveries(error: String) {
        self.showAlert(message: error)
    }
}
