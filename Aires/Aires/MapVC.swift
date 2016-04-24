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
    var annotations = [MKPointAnnotation]()
    var type = "Cough"
    override func viewDidLoad() {
        
        //*IMPORTANT*
        mapView.delegate = self
        
        //Irvine
        let location = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Cough"
        annotation.subtitle = "8"
        annotations.append(annotation)
        mapView.addAnnotation(annotation)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        // simple and inefficient example
        
        let annotationView = MKPinAnnotationView()
        if(type == "Cough"){
            annotationView.pinTintColor = UIColor.greenColor()
        }else if(type == "Breath"){
            annotationView.pinTintColor = UIColor.purpleColor()
        }else if(type == "Wheeze"){
            annotationView.pinTintColor = UIColor.blueColor()

        }else if(type == "Nasal"){
            annotationView.pinTintColor = UIColor.brownColor()

        }else if(type == "Sneeze"){
            annotationView.pinTintColor = UIColor.yellowColor()

        }else{
            annotationView.pinTintColor = UIColor.redColor()

        }
        return annotationView
    }

    @IBAction func coughPressed(sender: AnyObject) {
        type = "Cough"
        mapView.removeAnnotations(annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        annotation.title = "Cough"
        annotation.subtitle = "8"
        annotations.append(annotation)
        mapView.addAnnotation(annotation)
        mapView.setCenterCoordinate(CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
            )
            , animated: true)
    }
  
    @IBAction func breathPressed(sender: AnyObject) {
        type = "Breath"
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        annotation.title = "Cough"
        annotation.subtitle = "8"
        annotations.append(annotation)
        mapView.removeAnnotations(annotations)
        mapView.setCenterCoordinate(mapView.region.center, animated: true)

    }
    
    @IBAction func wheezePressed(sender: AnyObject) {
        type = "Wheeze"
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        annotation.title = "Cough"
        annotation.subtitle = "8"
        annotations.append(annotation)
        mapView.removeAnnotations(annotations)

    }
   
    @IBAction func nasalObstruction(sender: AnyObject) {
        type = "Nasal"
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        annotation.title = "Cough"
        annotation.subtitle = "8"
        annotations.append(annotation)
        mapView.removeAnnotations(annotations)

    }
    @IBAction func sneezingPressed(sender: AnyObject) {
        type = "Sneeze"
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        annotation.title = "Cough"
        annotation.subtitle = "8"
        annotations.append(annotation)
        mapView.removeAnnotations(annotations)

    }
    @IBAction func itchyEyes(sender: AnyObject) {
        type = "Itchy"
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
            latitude: 33.6839,
            longitude:  -117.8222222
            
        )
        annotation.title = "Cough"
        annotation.subtitle = "8"
        annotations.append(annotation)
        mapView.removeAnnotations(annotations)

    }
}
