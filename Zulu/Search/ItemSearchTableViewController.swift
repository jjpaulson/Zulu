//
//  ItemSearchTableViewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/11/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import os.log

class ItemSearchTableViewController: UITableViewController {

    var store = DataStore.sharedInstance
    var selectGroceryItems: Bool? = false
    
    // Search Bar https://www.raywenderlich.com/157864/uisearchcontroller-tutorial-getting-started
    var searchController : UISearchController? = nil
    var filteredInventory: [String: Item] = [String: Item]()
    
    var currItem: Item? = nil
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Functions for searching inventory
    func isFiltering() -> Bool {
        //let searchBarScopeIsFiltering = searchController?.searchBar.selectedScopeButtonIndex != 0
        //return (!searchBarIsEmpty() || searchBarScopeIsFiltering)
        return (!searchBarIsEmpty())
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController!.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String,  scope: String = "All") {
        let all = (scope == "All")
        
        filteredInventory = store.Products.filter {
            ($0.value.initName.lowercased().contains(searchText.lowercased()) || searchBarIsEmpty())
        }
        
        tableView.reloadData()
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
        if isFiltering() {
            return filteredInventory.count
        }
        
        return self.store.Products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "InventoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InventoryItemCell else {
            fatalError("The deqeued cell is not an instance of InventoryItemCell")
        }
        
        let newItem: Item
        
        if isFiltering() {
            newItem = Array(filteredInventory)[indexPath.row].value
        } else {
            newItem = Array(self.store.Products)[indexPath.row].value
        }
        cell.productNameLabel.text = newItem.initName
        //Test
        let priceString = String.localizedStringWithFormat("%.2f", newItem.initPrice)
        //cell.productPriceLabel.text = "$\(newItem.initPrice)"
        cell.productPriceLabel.text = "$" + priceString
        //Test
        cell.productImageView.image = UIImage(named: newItem.initPhotoStr)
        
        let locationStr = newItem.initAisleStr
        let locationLabel: UILabel = cell.productQuantityLabel
        locationLabel.text = locationStr
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is SelectedItemDisplay {
            (segue.destination as! SelectedItemDisplay).currItem = currItem
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectGroceryItems! == nil || (selectGroceryItems == false) {
            print("false")
            return
        }else {
            if isFiltering() {
                currItem = Array(filteredInventory)[indexPath.row].value
            } else {
                currItem = Array(self.store.Products)[indexPath.row].value
            }
            self.performSegue(withIdentifier: "ToItemDisplaySegue", sender: nil)
            return
        }
 
    }
    
}
