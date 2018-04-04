//
//  CartOverViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 3/31/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class ReceiptViewController: UIViewController {
    
    var store = DataStore.sharedInstance
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var ChildTableView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var HomeNavButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if store.selectedReceipt != nil {
            setTotalPrice(date: store.selectedReceipt!)
            dateLabel.text = store.selectedReceipt
        }
        (self.childViewControllers[0] as! VirtualCartTableViewController).test = nil
        
    }
    
    func totalCostOfItems(items: [Item: Int]) -> Float {
        var totalPrice : Float = 0.0
        //Test
        for Item in items {
            totalPrice += (Item.key.initPrice) * Float(Item.value)
        }
        return totalPrice
    }
    
    func setTotalPrice(date: String) {
        let items : [Item: Int] = store.PreviousPerchases[date]!
        let totalPriceString = String.localizedStringWithFormat("%.2f", totalCostOfItems(items: items))
        totalPriceLabel.text = "$" + totalPriceString
    }
    
}

