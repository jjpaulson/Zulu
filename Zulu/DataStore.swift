//
//  DataStore.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/23/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import Foundation
import UIKit

class DataStore {
    static let sharedInstance = DataStore()
    private init() {}
    var Items : [Item] = []
    var Products : [String : Item] = [
        "Spaghetti" : Item(name: "Spaghetti", price: 5.75),
        "Milk" : Item(name: "Milk", price: 3.99),
        "Cereal" : Item(name: "Cereal", price: 7.00),
        "Donuts" : Item(name: "Donuts", price: 6.50),
        "Celery" : Item(name: "Celery", price: 9.99),
    ]
    
    var productToAdd : Item? = Item(name: "", price: 0.0)
    
    var filePath : String {
        //Manager lets you examine contents of files and folders in your app; creates a directory to where we are saving it
        let manager = FileManager.default
        
        //This returns an array of urls from our documentDirectory and we take the first path
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        print("This is the url path in the documentDirectory \(url)")
        
        //Creates a new path component and creates a new path called Data which is where we will store our data array and save it to our file path. This does everything for encoding and decoding
        
        return (url!.appendingPathComponent("Data").path)
    }
}
