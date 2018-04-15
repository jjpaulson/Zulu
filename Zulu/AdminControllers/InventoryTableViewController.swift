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
    
    // Search Bar https://www.raywenderlich.com/157864/uisearchcontroller-tutorial-getting-started
    var searchController : UISearchController? = nil
    var filteredInventory: [Item: (Int, Int)] = [Item: (Int, Int)]()
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Functions for searching inventory
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController?.searchBar.selectedScopeButtonIndex != 0
        return (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }

    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController!.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String,  scope: String = "All") {
        let all = (scope == "All")
        
        filteredInventory = store.staticInventory.filter{
            ($0.key.initName.lowercased().contains(searchText.lowercased()) || searchBarIsEmpty())
                && (all || $0.value.0 <= $0.value.1) } //if inventory# <= inventory low threshold

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
        
        return self.store.staticInventory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "InventoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InventoryItemCell else {
            fatalError("The deqeued cell is not an instance of InventoryItemCell")
        }
        
        let newItem: Item
        let quantity: Int
        let low_threshold: Int
        
        if isFiltering() {
            newItem = Array(filteredInventory)[indexPath.row].key
            quantity = Array(filteredInventory)[indexPath.row].value.0
            low_threshold = Array(filteredInventory)[indexPath.row].value.1
        } else {
            newItem = Array(self.store.staticInventory)[indexPath.row].key
            quantity = Array(self.store.staticInventory)[indexPath.row].value.0
            low_threshold = Array(self.store.staticInventory)[indexPath.row].value.1
        }
        cell.productNameLabel.text = newItem.initName
        //Test
        let priceString = String.localizedStringWithFormat("%.2f", newItem.initPrice)
        //cell.productPriceLabel.text = "$\(newItem.initPrice)"
        cell.productPriceLabel.text = "$" + priceString
        //Test
        cell.productImageView.image = UIImage(named: newItem.initPhotoStr)
        cell.productQuantityLabel.text = "Quantity: \(quantity)"
        if quantity <= low_threshold {
            cell.productQuantityLabel.textColor = UIColor.red
        } else {
            cell.productQuantityLabel.textColor = UIColor.black
        }
        
        return cell
    }
    
}
