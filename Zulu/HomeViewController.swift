//
//  HomeViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/22/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
//import FirebaseDatabase
import BTNavigationDropdownMenu

class HomeViewController: UIViewController {
    
    //var ref : DatabaseReference?
    var store = DataStore.sharedInstance
    
    @IBOutlet weak var CustomerButton: UIButton!
    @IBOutlet weak var AdminButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black;
        loadData()
        loadTestData()
        
        CustomerButton.layer.cornerRadius = 10
        CustomerButton.clipsToBounds = true
        
        AdminButton.layer.cornerRadius = 10
        AdminButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
        //ref = Database.database().reference()
    }
    
    private func loadTestData() {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: store.receiptsFilePath) as? [[[Any]]] {
            var output :[String: [Item: Int]] = [String: [Item: Int]]()
            for i in 0..<ourData[0].count {
                let dateStr = ourData[0][i][0] as! String
                var dict: [Item: Int] = [Item: Int]()
                for j in 0..<(ourData[1][i] as AnyObject).count {
                    let item = (ourData[1][i] as! [Item])[j]
                    let quant = (ourData[2][i] as! [Int])[j]
                    dict[item] = quant
                }
                output[dateStr] = dict
            }
            store.PreviousPerchases = output
            print("SUCCESSFUL LOAD")
        } else {
            print("FAILED LOAD")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func customerButtonTapped(_ sender: Any) {
        print("Customer button tapped")
        
        self.performSegue(withIdentifier: "GoToCustomerScreen", sender: self)
    }
    
//    @IBAction func adminButtonTapped(_ sender: Any) {
//        print("Admin button tapped")
//
//        self.performSegue(withIdentifier: "GoToAdminScreen", sender: self)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadData() {
        //Reset data
        //NSKeyedArchiver.archiveRootObject([], toFile: store.filePath)
        //NSKeyedArchiver.archiveRootObject([], toFile: store.filePath2)
        
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
        if items.count == 0 {
            return
        }
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
    
}
