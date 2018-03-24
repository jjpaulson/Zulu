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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
