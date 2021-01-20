//
//  DeliveryListCell.swift
//  PaackTest-iOS
//
//  Created by mohamed mernissi on 1/20/21.
//

import UIKit

class DeliveryListCell: UITableViewCell {
    
    // MARK:  IBOutlets
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    

    // MARK:  Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK:  Setup
    
    func setup(with delivery : DeliveryEntity){
        lblName.text = delivery.customerName
        lblAddress.text = delivery.address
    }
    
}
