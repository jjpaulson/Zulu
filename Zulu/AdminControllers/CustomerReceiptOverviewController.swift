//
//  CustomerReceiptOverviewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/5/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class CustomerReceiptOverviewController: UIViewController {
    
    var store = DataStore.sharedInstance
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        print( segue.identifier ?? "Something" )
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTotalPrice()
    }
    
    func totalCostOfItems() -> Float {
        var totalPrice : Float = 0.0
        //Test
        if Array(self.store.PreviousPerchases).count == 0 {
            return totalPrice
        }
        for Item in Array(self.store.PreviousPerchases)[0].value {
            totalPrice += (Item.key.initPrice) * Float(Item.value)
        }
        return totalPrice
    }
    
    func setTotalPrice() {
        let totalPriceString = String.localizedStringWithFormat("%.2f", totalCostOfItems())
        totalPriceLabel.text = "$" + totalPriceString
    }
    
}

