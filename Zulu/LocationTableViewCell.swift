//
//  LocationTableViewCell.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/30/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var NumOfVisitsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
