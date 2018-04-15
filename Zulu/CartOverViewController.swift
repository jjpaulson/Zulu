//
//  CartOverViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 3/31/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class CartOverViewController: UIViewController {
    
    var store = DataStore.sharedInstance
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var ChildTableView: UIView!
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print( segue.identifier ?? "Something" )
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTotalPrice()
        (self.childViewControllers[0] as! VirtualCartTableViewController).test = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is ZephyrViewController {
            (segue.destination as! ZephyrViewController).fromPay = true
        }
    }

    func totalCostOfItems() -> Float {
        var totalPrice : Float = 0.0
        //Test
        for Item in self.store.ItemsDict {
            totalPrice += (Item.key.initPrice) * Float(Item.value)
        }
        return totalPrice
    }
    
    @IBAction func update(_ sender: AnyObject)
    {
        print("UPDATE")
        setTotalPrice()
    }
    
    func setTotalPrice() {
        let totalPriceString = String.localizedStringWithFormat("%.2f", totalCostOfItems())
        totalPriceLabel.text = "$" + totalPriceString
    }
    
}
