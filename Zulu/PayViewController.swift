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
        subtotalLabel.text = "Subtotal: $" + totalPriceString
        firstLastNameField.text = "Jonathan Paulson"
        addressField.text = "604 E Armory Ave"
        cityStateField.text = "Champaign, IL"
        zipCodeField.text = "61820"
        cardNumberField.text = "123456789"
        
        purchaseButton.layer.cornerRadius = 10
        purchaseButton.clipsToBounds = true
        
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
            cardNumberString!.isEmpty || totalCostOfItems() <= 0.0
        {
            print("Bad input")
            return
        }
        
        //https://stackoverflow.com/questions/24070450/how-to-get-the-current-time-as-datetime/32445947
        
        let date = Date().description(with: .current)
        print(date)
        store.PreviousPerchases[date] = store.ItemsDict
        store.selectedReceipt = date
        
        store.ItemsDict = [Item: Int]()
        
        saveReceiptData()
        saveData()
        
        self.performSegue(withIdentifier: "toReceiptSegue", sender: sender)
        //print(store.PreviousPerchases)
        //Go to next thing
        
    }
    
    private func saveReceiptData(){
        var data : [[Any]] = []
        data.append([])
        data.append([])
        data.append([])
        
        for receipt_date in store.PreviousPerchases.keys {
            data[0].append([receipt_date])
            data[1].append(Array(store.PreviousPerchases[receipt_date]!.keys))
            data[2].append(Array(store.PreviousPerchases[receipt_date]!.values))
        }
        
        NSKeyedArchiver.archiveRootObject(data, toFile: store.receiptsFilePath)
    }
    
    private func saveData(){
        //NSKeyedArchiver is going to look through every Item class and list and look for encode function and is going to encode our data and save it
        
        //archiveRootObject saves our array of items to our filepath url
        //Test changed Items -> ItemsDict
        NSKeyedArchiver.archiveRootObject(Array(self.store.ItemsDict.keys), toFile: store.filePath)
        NSKeyedArchiver.archiveRootObject(Array(self.store.ItemsDict.values), toFile: store.filePath2)
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

