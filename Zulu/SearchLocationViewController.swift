//
//  SearchLocationViewController.swift
//  Zulu
//
//  Created by Jonathan Paulson on 3/30/18.
//  Copyright © 2018 Zulu. All rights reserved.
//

import UIKit
import MapKit



class SearchLocationViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 41.259141, longitude: -96.0171409)
        
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius, regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        
        centerMapOnLocation(location: initialLocation)
        // Do any additional setup after loading the view.
        let annotation = MKPointAnnotation()
        annotation.title = "Thompson Center"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 41.259141, longitude: -96.0171409)
        mapView.addAnnotation(annotation)
        
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
