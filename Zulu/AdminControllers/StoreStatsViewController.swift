//
//  StoreStatsViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/15/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class StoreStatsViewController: UIViewController {
    
    @IBOutlet weak var weekMonthSegment: UISegmentedControl!
    @IBOutlet weak var averageTimeLabel: UILabel!
    @IBOutlet weak var minTimeLabel: UILabel!
    @IBOutlet weak var maxTimeLabel: UILabel!
    @IBOutlet weak var numberUsersLabel: UILabel!
    @IBOutlet weak var dollarsSoldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekMonthSegment.layer.cornerRadius = 5
        weekMonthSegment.clipsToBounds = true
        
        if weekMonthSegment.selectedSegmentIndex == 0 { //Week
            averageTimeLabel.text = "1 min. 42 sec."
            minTimeLabel.text = "0 min. 41 sec."
            maxTimeLabel.text = "4 min. 15 sec."
            numberUsersLabel.text = "213"
            dollarsSoldLabel.text = "$6,975.75"
        } else {
            averageTimeLabel.text = "1 min. 46 sec."
            minTimeLabel.text = "0 min. 39 sec."
            maxTimeLabel.text = "5 min. 37 sec."
            numberUsersLabel.text = "1034"
            dollarsSoldLabel.text = "$33,863.53"
        }
        
    }
    
    @IBAction func weekMonthChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { //Week
            averageTimeLabel.text = "1 min. 42 sec."
            minTimeLabel.text = "0 min. 41 sec."
            maxTimeLabel.text = "4 min. 15 sec."
            numberUsersLabel.text = "213"
            dollarsSoldLabel.text = "$6,975.75"
        } else {
            averageTimeLabel.text = "1 min. 46 sec."
            minTimeLabel.text = "0 min. 39 sec."
            maxTimeLabel.text = "5 min. 37 sec."
            numberUsersLabel.text = "1034"
            dollarsSoldLabel.text = "$33,863.53"
        }
    }
}
