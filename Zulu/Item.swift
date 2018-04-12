//
//  Item.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/23/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import os.log

class Item: NSObject, NSCoding {
    struct Keys {
        static let name = "name"
        static let price = "price"
        static let photo_str = "photo"
        // key for decoding aisle string
        //static let aisle_str = "aisle #"
    }

    var initName: String = ""
    var initPrice: Float = 0.0
    //TEST
    var initPhotoStr: String = "photo"
    var initAisleStr: String = "aisle #"
    //private var photo: UIImage? = nil
    
    override init(){}
    
    init(name: String, price: Float, photo_str: String, aisle_str: String = "None") {
        self.initName = name
        self.initPrice = price
        //TEST
        self.initPhotoStr = photo_str
        self.initAisleStr = aisle_str
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let nameObject = aDecoder.decodeObject(forKey: Keys.name) as? String
            else {
                os_log("Unable to decode the name for the item", log: OSLog.default, type: .debug)
                return nil
        }
        initName = nameObject
        
        let priceObject = aDecoder.decodeFloat(forKey: Keys.price)
        initPrice = priceObject
        
        guard let photoObject = aDecoder.decodeObject(forKey: Keys.photo_str) as? String else {
            return nil
        }
        initPhotoStr = photoObject
        
        // Decode aisle string
//        guard let aisleObject = aDecoder.decodeObject(forKey: Keys.aisle_str) as? String
//            else {
//                return nil
//        }
        //let photo = aDecoder.decodeObject(forKey: Keys.photo) as? UIImage
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(initName, forKey: Keys.name)
        aCoder.encode(initPrice, forKey: Keys.price)
        aCoder.encode(initPhotoStr, forKey: Keys.photo_str)
    }
    
}
