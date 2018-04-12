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
    
    private init() {
        // Static inventory is of type [Item, (Amount, LowThreshold)]
        staticInventory = [
            Products["Spaghetti"]! : (500, 50),
            Products["Milk"]! : (30, 10),
            Products["Cereal"]! : (15, 50),
            Products["Donuts"]! : (35, 24),
            Products["Celery"]! : (20, 40),
            Products["Chicken"]! : (75, 50),
            Products["Bananas"]! : (75, 25),
            Products["Bagels"]! : (0, 24),
            Products["LaCroix"]! : (50, 24),
            Products["CheeseSticks"]! : (10, 30),
            Products["ChocolateMilk"]! : (15, 10),
            Products["Cashews"]! : (50, 75),
            Products["FrostedFlakes"]! : (30, 20)
        ]
        print(staticInventory)
    }
    
    var Items : [Item] = []

    var ItemsDict: [Item: Int] = [Item: Int]()
    var shoppingList: [Item: (Int, Bool)] = [Item: (Int, Bool)]()
    
    var PreviousPerchases: [String: [Item:Int]] = [String:[Item:Int]]()
    var selectedReceipt: String? = nil
    
    var checkoutStation: String? = nil
//    var Products : [String : Item] = [
//        "Spaghetti" : Item(name: "Spaghetti", price: 5.75),
//        "Milk" : Item(name: "Milk", price: 3.99),
//        "Cereal" : Item(name: "Cereal", price: 7.00),
//        "Donuts" : Item(name: "Donuts", price: 6.50),
//        "Celery" : Item(name: "Celery", price: 9.99),
//    ]

    var Products : [String : Item] = [
        
        "LaCroix" : Item(name: "LaCroix", price: 3.18, photo_str: "LaCroix",
                         aisle_str: "Aisle 4"),
        "CheeseSticks" : Item(name: "Cheese Sticks 12 Ct.", price: 3.94, photo_str: "CheeseSticks",
                         aisle_str: "Aisle 6"),
        "ChocolateMilk" : Item(name: "Oberweis Chocolate Milk", price: 3.94, photo_str: "ChocolateMilk",
                              aisle_str: "Aisle 6"),
        "Cashews" : Item(name: "Cashews 24 oz.", price: 9.92, photo_str: "Cashews",
                              aisle_str: "Aisle 7"),
        "FrostedFlakes" : Item(name: "Frosted Flakes", price: 3.25, photo_str: "FrostedFlakes",
                              aisle_str: "Aisle 7"),
        
        "Spaghetti" : Item(name: "Spaghetti", price: 5.75, photo_str: "Spaghetti",
                           aisle_str: "Aisle 2"),
        "Milk" : Item(name: "Milk", price: 3.99, photo_str: "Milk",
                      aisle_str: "Aisle 6"),
        "Cereal" : Item(name: "Cereal", price: 7.00, photo_str: "Cereal",
                        aisle_str: "Aisle 5"),
        "Donuts" : Item(name: "Donuts", price: 6.50, photo_str: "Donuts",
                        aisle_str: "Bakery"),
        "Celery" : Item(name: "Celery", price: 9.99, photo_str: "Celery",
                        aisle_str: "Fresh Foods"),
        "Chicken" : Item(name: "Chicken", price: 8.99, photo_str: "Chicken",
                         aisle_str: "Butcher"),
        "Bananas" : Item(name: "Bananas", price: 7.99, photo_str: "Bananas",
                         aisle_str: "Aisle 12"),
        "Bagels" : Item(name: "Bagels", price: 4.99, photo_str: "Bagels",
                        aisle_str: "Aisle 11")
        ]
    
    // Static inventory is of type [Item, (Amount, LowThreshold)]
    var staticInventory : [Item: (Int, Int)] = [Item: (Int, Int)]()
    
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
