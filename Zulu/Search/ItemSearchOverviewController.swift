//
//  ItemSearchOverviewController.swift
//  Zulu
//
//  Created by Alexandre Geubelle on 4/11/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class ItemSearchOverviewController: UIViewController {
    
    var store = DataStore.sharedInstance
    
    var selectGroceryItems: Bool? = false
    
    var child: ItemSearchTableViewController? = nil
    // Search Bar https://www.raywenderlich.com/157864/uisearchcontroller-tutorial-getting-started
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        child = self.childViewControllers.first as? ItemSearchTableViewController
        child?.selectGroceryItems = selectGroceryItems
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Items"

        searchController.searchBar.tintColor = UIColor.black
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //searchController.searchBar.scopeButtonTitles = ["All", "Low"]
        //searchController.searchBar.delegate = self
        
        
        // Set search controller.
        child?.searchController = searchController
    }
    
    
}

extension ItemSearchOverviewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        //let searchBar = searchController.searchBar
        //let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        child?.filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension ItemSearchOverviewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        child?.filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
