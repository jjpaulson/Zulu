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
        //static let photo = "photo"
    }

    var initName: String = ""
    var initPrice: Float = 0.0
    //private var photo: UIImage? = nil
    
    override init(){}
    
    init(name: String, price: Float) {
        self.initName = name
        self.initPrice = price
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
        //let photo = aDecoder.decodeObject(forKey: Keys.photo) as? UIImage
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(initName, forKey: Keys.name)
        aCoder.encode(initPrice, forKey: Keys.price)
        //aCoder.encode(photo, forKey: Keys.photo)
    }
    
}
