//
//  MapOverlay.swift
//  iScout
//
//  Created by   on 4/2/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import UIKit
import MapKit

class MapOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    
    init(area: Lexington) {
        boundingMapRect = area.overlayBoundingMapRect
        coordinate = area.midCoordinate
    }
}

