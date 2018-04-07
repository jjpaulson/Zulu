//
//  CustomerScreenViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/22/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class CustomerScreenViewController: UIViewController {

    var store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func VirtualCartButton(_ sender: Any) {
        print("Segue2")
        performSegue(withIdentifier: "VirtualCart", sender: nil)
    }
    
    @IBAction func CheckoutButton(_ sender: Any) {
        print("Segue")
        performSegue(withIdentifier: "Checkout", sender: nil)
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
