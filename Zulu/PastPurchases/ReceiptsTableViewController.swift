//
//  VirtualCartTableViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/23/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import os.log

class ReceiptsTableViewController: UITableViewController {
    
    //MARK Properties
    
    var store = DataStore.sharedInstance
    var sortedDates: [Date: String] = [Date: String]()
    var sortedDateKeys: [Date] = []
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(animated)
        
        var allDates: [Date] = []
        var stringDates: [String] = []
        
        // http://userguide.icu-project.org/formatparse/datetime#TOC-Parsing-Dates
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy 'at' h:mm:ss a zzzz"
        
        for dateStr:String! in store.PreviousPerchases.keys {
            guard let date = dateFormatter.date(from: dateStr) else {
                fatalError("ERROR: Date conversion failed due to mismatched format.")
            }
            stringDates.append(dateStr)
            allDates.append(date)
        }
        
        for i in 0..<allDates.count {
            sortedDates[allDates[i]] = stringDates[i]
        }
        
        // https://stackoverflow.com/questions/38168594/sort-objects-in-array-by-date
        sortedDateKeys = Array(sortedDates.keys).sorted(by: { $0.compare($1) == .orderedDescending })
        
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
        return sortedDates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ReceiptTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PreviousPurchasesCell else {
            fatalError("The deqeued cell is not an instance of ProductTableViewCell")
        }
        
        let date: Date = sortedDateKeys[indexPath.row]
        var dateString: String! = sortedDates[date]
        let items = self.store.PreviousPerchases[dateString]!
        
        if let dotRange = dateString.range(of: "AM") {
            dateString.removeSubrange(dotRange.upperBound..<dateString.endIndex)
        }
        if let dotRange = dateString.range(of: "PM") {
            dateString.removeSubrange(dotRange.upperBound..<dateString.endIndex)
        }
        
        cell.receiptDateLabel.text = dateString
        let subtotal = totalCostOfItems(items: items)
        let totalPriceString = String.localizedStringWithFormat("%.2f", subtotal)
        cell.receiptTotalLabel.text = "$" + totalPriceString
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let date: Date = sortedDateKeys[indexPath.row]
        var dateString: String! = sortedDates[date]
        store.selectedReceipt = dateString
        self.performSegue(withIdentifier: "TableToReceiptViewSegue", sender: nil)
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
        // Do nothing.
    }
    
    func totalCostOfItems(items: [Item: Int]) -> Float {
        var totalPrice : Float = 0.0
        //Test
        for Item in items {
            totalPrice += (Item.key.initPrice) * Float(Item.value)
        }
        return totalPrice
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

