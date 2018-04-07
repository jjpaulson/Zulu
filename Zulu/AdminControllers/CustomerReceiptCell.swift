//
//  CustomerReceiptCell.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/5/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class CustomerReceiptCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    //Test
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productQuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
