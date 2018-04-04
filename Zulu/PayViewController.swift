//
//  CartOverViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 3/31/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class PayViewController: UIViewController {
    
    var store = DataStore.sharedInstance
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var firstLastNameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var cityStateField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cardNumberField: UITextField!
    @IBOutlet weak var purchaseButton: UIButton!
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        print( segue.identifier ?? "Something" )
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let totalPriceString = String.localizedStringWithFormat("%.2f", totalCostOfItems())
        subtotalLabel.text = "$" + totalPriceString
        
    }
    
//    override func didMove(toParentViewController parent: UIViewController?) {
//        // Happens when you are going back from Pay view one idk why
//        print("TEST")
//        print(parent)
//        guard let test = parent as? ReceiptViewController else {
//            print("Not Receipt")
//            return
//        }
//
//        print(test)
//        if parent == nil {
//            //self.performSegue(withIdentifier: "ReceiptToHomeSegue", sender: nil)
//        }
//    }
    
    @IBAction func purchaseButtonPressed(_ sender: Any) {
        // Go to next view if all input has been filled in
        let firstLastNameString: String? = firstLastNameField.text
        let addressString: String? = addressField.text
        let cityStateString: String? = cityStateField.text
        let zipCodeString: String? = zipCodeField.text
        let cardNumberString: String? = cardNumberField.text
        print(firstLastNameString)
        print(addressString)
        print(cityStateString)
        print(zipCodeString)
        print(cardNumberString)
        if firstLastNameString == nil || addressString == nil ||
            cityStateString == nil || zipCodeString == nil ||
            cardNumberString == nil ||
            firstLastNameString!.isEmpty || addressString!.isEmpty ||
            cityStateString!.isEmpty || zipCodeString!.isEmpty ||
            cardNumberString!.isEmpty
        {
            print("Bad input")
            return
        }
        
        //https://stackoverflow.com/questions/24070450/how-to-get-the-current-time-as-datetime/32445947
        
        let date = Date().description(with: .current)
        print(date)
        store.PreviousPerchases[date] = store.ItemsDict
        store.selectedReceipt = date
        self.performSegue(withIdentifier: "toReceiptSegue", sender: sender)
        //print(store.PreviousPerchases)
        //Go to next thing
        
    }
    
    func totalCostOfItems() -> Float {
        var totalPrice : Float = 0.0
        //Test
        for Item in self.store.ItemsDict {
            totalPrice += (Item.key.initPrice) * Float(Item.value)
        }
        return totalPrice
    }
}

