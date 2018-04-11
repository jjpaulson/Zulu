//
//  LocationDescriptionViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/30/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit

class LocationDescriptionViewController: UIViewController {

    @IBOutlet weak var SeeHoursButton: UIButton!
    @IBOutlet weak var SearchInventoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SeeHoursButton.layer.cornerRadius = 10
        SeeHoursButton.clipsToBounds = true
        
        SearchInventoryButton.layer.cornerRadius = 10
        SearchInventoryButton.clipsToBounds = true
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
