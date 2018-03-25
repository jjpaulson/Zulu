//
//  ProductConfirmationViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/24/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class ProductConfirmationViewController: UIViewController {
    var store = DataStore.sharedInstance
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productNameLabel.text = store.productToAdd.initName
        productPriceLabel.text = "$\(store.productToAdd.initPrice)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        self.saveData(item: store.productToAdd)
        performSegue(withIdentifier: "GoBackHome", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func saveData(item: Item){
        self.store.Items.append(item)
        
        //NSKeyedArchiver is going to look through every Item class and list and look for encode function and is going to encode our data and save it
        
        //archiveRootObject saves our array of items to our filepath url
        NSKeyedArchiver.archiveRootObject(self.store.Items, toFile: store.filePath)
    }
}
