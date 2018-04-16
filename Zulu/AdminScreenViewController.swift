//
//  AdminScreenViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/22/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class AdminScreenViewController: UIViewController {

    @IBOutlet weak var InventoryButton: UIButton!
    @IBOutlet weak var CheckReceiptsButton: UIButton!
    @IBOutlet weak var storeDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InventoryButton.layer.cornerRadius = 10
        InventoryButton.clipsToBounds = true
        
        CheckReceiptsButton.layer.cornerRadius = 10
        CheckReceiptsButton.clipsToBounds = true
        
        storeDataButton.layer.cornerRadius = 10
        storeDataButton.clipsToBounds = true
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
