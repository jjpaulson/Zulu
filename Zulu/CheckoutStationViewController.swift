//
//  CheckoutStationViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/12/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class CheckoutStationViewController: UIViewController {
    
    var store = DataStore.sharedInstance
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var nextScreenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = store.checkoutStation
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
