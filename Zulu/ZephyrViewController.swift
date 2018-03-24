//
//  ZephyrViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/23/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class ZephyrViewController: UIViewController {
    var store = DataStore.sharedInstance
    
    
    @IBOutlet weak var namingTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if namingTextField.text != "" {
            if let unwrappedText = namingTextField.text {
                switch unwrappedText {
                case "Item1":
                    let newItem = Item(name: unwrappedText, price: 2.75)
                    self.saveData(item: newItem)
                case "Item2":
                    let newItem = Item(name: unwrappedText, price: 3.75)
                    self.saveData(item: newItem)
                case "Item3":
                    let newItem = Item(name: unwrappedText, price: 4.75)
                    self.saveData(item: newItem)
                case "Item4":
                    let newItem = Item(name: unwrappedText, price: 5.75)
                    self.saveData(item: newItem)
                case "Item5":
                    let newItem = Item(name: unwrappedText, price: 6.75)
                    self.saveData(item: newItem)
                default:
                    let newItem = Item(name: unwrappedText, price: 9.99)
                    self.saveData(item: newItem)
                }
            }
        }
    }
    
    /*
    var filePath : String {
        //Manager lets you examine contents of files and folders in your app; creates a directory to where we are saving it
        let manager = FileManager.default
        
        //This returns an array of urls from our documentDirectory and we take the first path
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        print("This is the url path in the documentDirectory \(url)")
        
        //Creates a new path component and creates a new path called Data which is where we will store our data array and save it to our file path. This does everything for encoding and decoding
        
        return (url!.appendingPathComponent("Data").path)
    }
    */
    private func saveData(item: Item){
        self.store.Items.append(item)
        
        //NSKeyedArchiver is going to look through every Item class and list and look for encode function and is going to encode our data and save it
        
        //archiveRootObject saves our array of items to our filepath url
        NSKeyedArchiver.archiveRootObject(self.store.Items, toFile: store.filePath)
    }
    
    private func loadData() {
        //If we can get our data back from our archives, get our data along our filepath and cast it as an array of Items
        
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: store.filePath) as? [Item] {
            self.store.Items = ourData
        }
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
