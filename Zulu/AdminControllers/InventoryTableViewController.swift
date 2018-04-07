//
//  InventoryTableViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/5/18.
//  Copyright © 2018 Zulu. All rights reserved.
//
import UIKit
import os.log

class InventoryTableViewController: UITableViewController {
    
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
        return self.store.staticInventory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "InventoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InventoryItemCell else {
            fatalError("The deqeued cell is not an instance of InventoryItemCell")
        }
        
        let newItem = Array(self.store.staticInventory)[indexPath.row].key
        let quantity = Array(self.store.staticInventory)[indexPath.row].value
        cell.productNameLabel.text = newItem.initName
        //Test
        let priceString = String.localizedStringWithFormat("%.2f", newItem.initPrice)
        //cell.productPriceLabel.text = "$\(newItem.initPrice)"
        cell.productPriceLabel.text = "$" + priceString
        //Test
        cell.productImageView.image = UIImage(named: newItem.initPhotoStr)
        cell.productQuantityLabel.text = "Quantity: \(quantity)"
        if quantity <= 10 {
            cell.productQuantityLabel.textColor = UIColor.red
        } else {
            cell.productQuantityLabel.textColor = UIColor.black
        }
        
        return cell
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
    
}
