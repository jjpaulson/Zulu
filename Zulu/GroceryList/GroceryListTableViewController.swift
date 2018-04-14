//
//  GroceryListTableViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/11/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import os.log

class GroceryListTableViewController: UITableViewController {
    
    //MARK Properties
    
    var store = DataStore.sharedInstance
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currItem : Item = Array(self.store.shoppingList)[indexPath.row].key
        let quantityAndDone : (Int, Bool) = Array(self.store.shoppingList)[indexPath.row].value
        store.shoppingList[currItem] = (quantityAndDone.0, !quantityAndDone.1)
        tableView.reloadData()
        store.saveGroceryList()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ListItemTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GroceryListItemTableViewCell else {
            fatalError("The deqeued cell is not an instance of ProductTableViewCell")
        }
        
        let newItem : Item = Array(self.store.shoppingList)[indexPath.row].key
        let quantityAndDone : (Int, Bool) = Array(self.store.shoppingList)[indexPath.row].value

        let done = quantityAndDone.1
        let quantity: Int = quantityAndDone.0
        
        
        
        if done {
            cell.checkedImage.image = UIImage(named: "checked-checkbox")
        } else {
            cell.checkedImage.image = UIImage(named: "unchecked-checkbox")
        }
        
        cell.productNameLabel.text = newItem.initName
        let priceString = String.localizedStringWithFormat("%.2f", newItem.initPrice)
        cell.productPriceLabel.text = "$" + priceString
        cell.productImageView.image = UIImage(named: newItem.initPhotoStr)
        cell.productQuantityLabel.text = "Quantity: \(quantity)"
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let indexItem = Array(self.store.shoppingList.keys)[indexPath.row]
            self.store.shoppingList[indexItem] = nil
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(self.parent)
            var parentOverview: GroceryListViewController? = self.parent as? GroceryListViewController
            if parentOverview != nil {
                parentOverview!.setTotalPrice()
            }
            store.saveGroceryList()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
}
