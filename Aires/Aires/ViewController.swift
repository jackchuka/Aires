//
//  ViewController.swift
//  Aires
//
//  Created by Sara Du on 4/22/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, ARDataSource
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    /// Creates random annotations around predefined center point and presents ARViewController modally
    func showARViewController()
    {
        // Check if device has hardware needed for augmented reality
        let result = ARViewController.createCaptureSession()
        if result.error != nil
        {
            let message = result.error?.userInfo["description"] as? String
            let alertView = UIAlertView(title: "Error", message: message, delegate: nil, cancelButtonTitle: "Close")
            alertView.show()
            return
        }
        
        // Create random annotations around center point    //@TODO
        //FIXME: set your initial position here, this is used to generate random POIs
        let lat = 33.6839
        let lon = -117.8222222
        let delta = 0.05
        let count = 50
        let dummyAnnotations = self.getDummyAnnotations(centerLatitude: lat, centerLongitude: lon, delta: delta, count: count)
        
        // Present ARViewController
        let arViewController = ARViewController()
        arViewController.debugEnabled = true
        arViewController.dataSource = self
        arViewController.maxDistance = 0
        arViewController.maxVisibleAnnotations = 100
        arViewController.maxVerticalLevel = 5
        arViewController.trackingManager.userDistanceFilter = 25
        arViewController.trackingManager.reloadDistanceFilter = 75
        
        ///////////////
        var annotations: [ARAnnotation] = []
        let annotation1 = ARAnnotation()
        annotation1.location = self.getRandomLocation(centerLatitude: 33.6839, centerLongitude: -117.8222222, delta: delta)
        annotation1.title = "POI"
        annotations.append(annotation1)

        arViewController.setAnnotations(annotations)
        /////////////
        
        self.presentViewController(arViewController, animated: true, completion: nil)
    }
    
   
    /// This method is called by ARViewController, make sure to set dataSource property.
    func ar(arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView
    {
        // Annotation views should be lightweight views, try to avoid xibs and autolayout all together.
        let annotationView = TestAnnotationView()
        annotationView.frame = CGRect(x: 0,y: 0,width: 150,height: 50)
        return annotationView;
    }
    
    
    
    
    
    
    private func getDummyAnnotations(centerLatitude centerLatitude: Double, centerLongitude: Double, delta: Double, count: Int) -> Array<ARAnnotation>
    {
        var annotations: [ARAnnotation] = []
        
        srand48(3)
        for var i = 0; i < count; i++
        {
            let annotation = ARAnnotation()
            annotation.location = self.getRandomLocation(centerLatitude: centerLatitude, centerLongitude: centerLongitude, delta: delta)
            annotation.title = "POI \(i)"
            annotations.append(annotation)
        }
        return annotations
    }
    
    private func getRandomLocation(centerLatitude centerLatitude: Double, centerLongitude: Double, delta: Double) -> CLLocation
    {
        var lat = centerLatitude
        var lon = centerLongitude
        
        let latDelta = -(delta / 2) + drand48() * delta
        let lonDelta = -(delta / 2) + drand48() * delta
        lat = lat + latDelta
        lon = lon + lonDelta
        return CLLocation(latitude: lat, longitude: lon)
    }
    
    @IBAction func buttonTap(sender: AnyObject)
    {
        showARViewController()
    }
}



















