//
//  StoreSearchViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/23/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class StoreSearchViewController: UIViewController {

    @IBOutlet weak var FavStoreButton: UIButton!
    @IBOutlet weak var LocationStoreButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FavStoreButton.layer.cornerRadius = 10
        FavStoreButton.clipsToBounds = true
        
        LocationStoreButton.layer.cornerRadius = 10
        LocationStoreButton.clipsToBounds = true
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
