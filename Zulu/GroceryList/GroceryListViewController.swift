//
//  GroceryList.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/11/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class GroceryListViewController: UIViewController {
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTotalPrice()
    }
    
    func totalCostOfItems() -> Float {
        var totalPrice : Float = 0.0
        //Test
        for Item in self.store.shoppingList {
            totalPrice += (Item.key.initPrice) * Float(Item.value.0)
        }
        return totalPrice
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is ItemSearchOverviewController {
            (segue.destination as! ItemSearchOverviewController).selectGroceryItems = true
        }
    }
    
    func setTotalPrice() {
        let totalPriceString = String.localizedStringWithFormat("%.2f", totalCostOfItems())
        totalPriceLabel.text = "$" + totalPriceString
    }
    
    
}
