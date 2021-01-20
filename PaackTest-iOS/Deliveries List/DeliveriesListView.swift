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
        self.setupTableView()
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
            cell.setup(with: delivery)
        }
        return cell
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
