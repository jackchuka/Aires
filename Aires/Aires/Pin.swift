//
//  Pin.swift
//  Aires
//
//  Created by Sara Du on 4/23/16.
//  Copyright © 2016 Sara Du. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Pin: NSObject, MKAnnotation{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var color:MKPinAnnotationColor
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, color: MKPinAnnotationColor) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.color = color
    }
}