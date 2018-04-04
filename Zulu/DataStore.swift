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
    //Test
    var ItemsDict: [Item: Int] = [Item: Int]()
    //Test
    var PreviousPerchases: [String: [Item:Int]] = [String:[Item:Int]]()
    var selectedReceipt: String? = nil
//    var Products : [String : Item] = [
//        "Spaghetti" : Item(name: "Spaghetti", price: 5.75),
//        "Milk" : Item(name: "Milk", price: 3.99),
//        "Cereal" : Item(name: "Cereal", price: 7.00),
//        "Donuts" : Item(name: "Donuts", price: 6.50),
//        "Celery" : Item(name: "Celery", price: 9.99),
//    ]

    var Products : [String : Item] = [
        "Spaghetti" : Item(name: "Spaghetti", price: 5.75, photo_str: "Spaghetti"),
        "Milk" : Item(name: "Milk", price: 3.99, photo_str: "Milk"),
        "Cereal" : Item(name: "Cereal", price: 7.00, photo_str: "Cereal"),
        "Donuts" : Item(name: "Donuts", price: 6.50, photo_str: "Donuts"),
        "Celery" : Item(name: "Celery", price: 9.99, photo_str: "Celery"),
        "Chicken" : Item(name: "Chicken", price: 8.99, photo_str: "Chicken"),
        "Bananas" : Item(name: "Bananas", price: 7.99, photo_str: "Bananas"),
        "Bagels" : Item(name: "Bagels", price: 4.99, photo_str: "Bagels")
        ]
    
    //Test
    //var productToAdd : Item = Item(name: "", price: 0.0)
    var productToAdd : Item = Item(name: "", price: 0.0, photo_str: "photo.png")
    
    var filePath : String {
        //Manager lets you examine contents of files and folders in your app; creates a directory to where we are saving it
        let manager = FileManager.default
        
        //This returns an array of urls from our documentDirectory and we take the first path
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        print("This is the url path in the documentDirectory \(url)")
        
        //Creates a new path component and creates a new path called Data which is where we will store our data array and save it to our file path. This does everything for encoding and decoding
        
        return (url!.appendingPathComponent("Data").path)
    }
    var filePath2 : String {
        //Manager lets you examine contents of files and folders in your app; creates a directory to where we are saving it
        let manager = FileManager.default
        
        //This returns an array of urls from our documentDirectory and we take the first path
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        print("This is the url path in the documentDirectory \(url)")
        
        //Creates a new path component and creates a new path called Data which is where we will store our data array and save it to our file path. This does everything for encoding and decoding
        
        return (url!.appendingPathComponent("Data2").path)
    }
    
    var receiptsFilePath : String {
        //Manager lets you examine contents of files and folders in your app; creates a directory to where we are saving it
        let manager = FileManager.default
        
        //This returns an array of urls from our documentDirectory and we take the first path
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        print("This is the url path in the documentDirectory \(url)")
        
        //Creates a new path component and creates a new path called Data which is where we will store our data array and save it to our file path. This does everything for encoding and decoding
        
        return (url!.appendingPathComponent("Receipts").path)
    }
}
