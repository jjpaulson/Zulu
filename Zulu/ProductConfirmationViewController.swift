//
//  ProductConfirmationViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/24/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class ProductConfirmationViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productNameLabel.text = store.productToAdd.initName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
