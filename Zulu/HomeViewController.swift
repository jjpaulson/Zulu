//
//  HomeViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/22/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
//import FirebaseDatabase

class HomeViewController: UIViewController {
    
    //var ref : DatabaseReference?
    var store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        //saveTestData()
        
        // Do any additional setup after loading the view.
        //ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func customerButtonTapped(_ sender: Any) {
        print("Customer button tapped")
        
        self.performSegue(withIdentifier: "GoToCustomerScreen", sender: self)
    }
    
    @IBAction func adminButtonTapped(_ sender: Any) {
        print("Admin button tapped")
        
        self.performSegue(withIdentifier: "GoToAdminScreen", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func saveTestData(){
        //Test
        var data : [[Any]] = []
        data[0] = []
        
        for receipt_date in store.PreviousPerchases.keys {
            data[0].append(receipt_date)
            
        }
        //NSKeyedArchiver is going to look through every Item class and list and look for encode function and is going to encode our data and save it
        
        //archiveRootObject saves our array of items to our filepath url
        //Test changed Items -> ItemsDict
        NSKeyedArchiver.archiveRootObject(Array(self.store.ItemsDict.keys), toFile: store.filePath)
        NSKeyedArchiver.archiveRootObject(Array(self.store.ItemsDict.values), toFile: store.filePath2)
    }
    
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
