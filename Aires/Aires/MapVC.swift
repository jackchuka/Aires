//
//  MapVC.swift
//  Aires
//
//  Created by Sara Du on 4/23/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MapVC: UIViewController, MKMapViewDelegate {
    let url = "http://masanoriuehara.com/api/aircheck/";
    var json = JSON([]);
    
    var longitude = [CLLocationDegrees]()
    var latitude = [CLLocationDegrees]()
    var location = [CLLocationCoordinate2D]()
    
    @IBOutlet weak var mapView: MKMapView!
    var annotations = [MKPointAnnotation]()
    var fakelocationarray = [CLLocationCoordinate2D]()
    override func viewDidLoad() {
        
        let params = [
            "user_id" : 1,
            "func" : "timeline"
        ];
        
        Alamofire.request(.GET, url, parameters: params, encoding: ParameterEncoding.URL).responseJSON { (_, _, result) in
            switch result {
            case .Success(let data):
                self.json = JSON(data)
                print(self.json)
                for index in 0...self.json.count-1{
                    self.latitude.append(Double(self.json[index]["latitude"].rawString()!)!)
                    self.longitude.append(Double(self.json[index]["longitude"].rawString()!)!)
                    print(self.json[index]["longitude"])
                    print(self.json[index]["latitude"])

                }
                for index in 0...self.latitude.count-1{
                    print("Worked")
                    self.location.append(CLLocationCoordinate2D(latitude: self.latitude[index], longitude: self.longitude[index]))
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = self.location[index]
                    self.mapView.addAnnotation(annotation)
                }
                
                self.mapView.reloadInputViews()
            case .Failure(_, let error):
                print("Request failed with error: \(error)")
            }
        }
        
        //*IMPORTANT*
        mapView.delegate = self
        
        
        //Irvine
        /*
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

        let location1 = CLLocationCoordinate2D(
            latitude: 33.7000,
            longitude:  -117.8222222
        
        )
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = location1
        annotation1.title = "Breath"
        annotation1.subtitle = "8"
        annotations.append(annotation1)
        mapView.addAnnotation(annotation1)
      */
        
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        // simple and inefficient example
        
        let annotationView = MKPinAnnotationView()
        let x = annotation as! MKPointAnnotation
        if(x.title == "Breath"){
            annotationView.pinTintColor = UIColor.blueColor()
        }
        else if(x.title == "Cough"){
            annotationView.pinTintColor = UIColor.greenColor()
        }
        else if(x.title == "Breath"){
            annotationView.pinTintColor = UIColor.purpleColor()
        }else if(x.title == "Wheeze"){
            annotationView.pinTintColor = UIColor.blueColor()

        }else if(x.title == "Nasal"){
            annotationView.pinTintColor = UIColor.brownColor()

        }else if(x.title == "Sneeze"){
            annotationView.pinTintColor = UIColor.yellowColor()
        }else{
            annotationView.pinTintColor = UIColor.redColor()

        }
        
        mapView.selectAnnotation(annotation, animated: true)

        return annotationView
    }
    
    
}
