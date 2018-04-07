//
//  VirtualCartTableViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/23/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import os.log

class VirtualCartTableViewController: UITableViewController {

    //MARK Properties
    
    var store = DataStore.sharedInstance
    var test: CartOverViewController? = nil
    
    @IBOutlet var myTableView: UITableView!
    
    private func loadData() {
        var items : [Item] = []
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: store.filePath) as? [Item] {
            items = ourData
            print("SUCCESSFUL LOAD")
        } else {
            print("FAILED LOAD")
        }
        var quantities : [Int] = []
        if let ourData2 = NSKeyedUnarchiver.unarchiveObject(withFile: store.filePath2) as? [Int] {
            quantities = ourData2
            print("SUCCESSFUL LOAD")
        } else {
            print("FAILED LOAD")
        }
        
        self.store.ItemsDict = [Item : Int]()
        for i in 0 ... (items.count - 1) {
            var found : Bool = false
            for item in self.store.ItemsDict.keys {
                if item.initName == items[i].initName {
                    self.store.ItemsDict[item] =
                        self.store.ItemsDict[item]! + quantities[i]
                    found = true
                }
            }
            if !found {
                self.store.ItemsDict[items[i]] = quantities[i]
            }
        }
        
        print(self.store.ItemsDict)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        
        //loadData()
        
        print(self.store.ItemsDict)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        //return self.store.Items.count
        //Test
        
        if test != nil {
            return self.store.ItemsDict.count
        } else {
            if self.store.selectedReceipt == nil {
                return 0
            }
            return self.store.PreviousPerchases[self.store.selectedReceipt!]!.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProductTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductTableViewCell else {
            fatalError("The deqeued cell is not an instance of ProductTableViewCell")
        }
        
//        let newItem = self.store.Items[indexPath.row]
//
//        cell.productNameLabel.text = newItem.initName
//        //Test
//        let priceString = String.localizedStringWithFormat("%.2f", newItem.initPrice)
//        //cell.productPriceLabel.text = "$\(newItem.initPrice)"
//        cell.productPriceLabel.text = "$" + priceString
//        //Test
//        cell.productImageView.image = UIImage(named: newItem.initPhotoStr)
        //Test
        var newItem : Item
        var quantity : Int
        if test != nil {
            newItem = Array(self.store.ItemsDict)[indexPath.row].key
            quantity = Array(self.store.ItemsDict)[indexPath.row].value
        } else {
            let itemsDict = self.store.PreviousPerchases[self.store.selectedReceipt!]!
            newItem = Array(itemsDict)[indexPath.row].key
            quantity = Array(itemsDict)[indexPath.row].value
        }
        cell.productNameLabel.text = newItem.initName
        //Test
        let priceString = String.localizedStringWithFormat("%.2f", newItem.initPrice)
        //cell.productPriceLabel.text = "$\(newItem.initPrice)"
        cell.productPriceLabel.text = "$" + priceString
        //Test
        cell.productImageView.image = UIImage(named: newItem.initPhotoStr)
        cell.productQuantityLabel.text = "Quantity: \(quantity)"

        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if test == nil {
                return
            }
            // Delete the row from the data source
            //self.store.Items.remove(at: indexPath.row)
            //Test
            let indexString = Array(self.store.ItemsDict.keys)[indexPath.row]
            self.store.ItemsDict[indexString] = nil
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveItems()
            
            if test != nil {
                test?.setTotalPrice()
            }
//            overview.update(CartOverViewController())
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func saveItems() {
        //let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(self.store.Items, toFile: store.filePath)
        //Test
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(Array(self.store.ItemsDict.keys), toFile: store.filePath)
        
        NSKeyedArchiver.archiveRootObject(Array(self.store.ItemsDict.values), toFile: store.filePath2)
        
        if isSuccessfulSave {
            os_log("Items successfully saved", log: OSLog.default, type: .debug)
            print("Successful Save")
        }
        else {
            os_log("Failed to save items...", log: OSLog.default, type: .error)
            print("Failed Save")
        }
    }

}
