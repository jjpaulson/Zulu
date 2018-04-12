//
//  SelectedItemDisplay.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/11/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class SelectedItemDisplay: UIViewController {
    
    var store = DataStore.sharedInstance
    var currItem: Item! = nil
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var addToListButton: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addToListButton.layer.cornerRadius = 10
        addToListButton.clipsToBounds = true
        
        if currItem == nil {
            itemNameLabel.text = "NONE"
            priceLabel.text = "NONE"
            quantityLabel.text = "Quantity: 0"
        } else {
            itemNameLabel.text = currItem.initName
            itemImage.image = UIImage(named: currItem.initPhotoStr)
            let priceString = String.localizedStringWithFormat("%.2f", currItem.initPrice)
            priceLabel.text = "$" + priceString
            let quantityString = String.localizedStringWithFormat("%.2d", Int(stepper.value))
            quantityLabel.text = "Quantity: " + quantityString
        }
        
    }
    
    @IBAction func addToListButtonPressed(_ sender: Any) {
        if Int(stepper.value) == 0 {
            return
        }
        for item: Item in store.shoppingList.keys {
            if item.initName == currItem.initName {
                store.shoppingList[item] = (Int(stepper.value), true)
                performSegue(withIdentifier: "addItemToGroceryListSegue", sender: sender)
                return
            }
        }
        store.shoppingList[currItem] = (Int(stepper.value), true)
        performSegue(withIdentifier: "addItemToGroceryListSegue", sender: sender)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let quantityString = String.localizedStringWithFormat("%.2d", Int(sender.value))
        quantityLabel.text = "Quantity: " + quantityString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

