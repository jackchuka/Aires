//
//  MapVC.swift
//  Aires
//
//  Created by Sara Du on 4/23/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        // 1
        let location = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        
        
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Cough"
        annotation.subtitle = "8"
        mapView.addAnnotation(annotation)
        
        //let first = Pin(title: "Cough", coordinate: CLLocationCoordinate2D(latitude: 33.7000,longitude:  -117.7000), info: "7", color: )
        //mapView.addAnnotation(first)
       
        
    }
   
}
