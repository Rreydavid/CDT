//
//  Legend.swift
//  iScout
//
//  Created by David Mercado on 4/7/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import UIKit
import MapKit

enum LegendType: Int {
    case coc = 0
    case medical
    case chow
    case supplies
    case bivouac
    case motorPool
    case fuel
    
    func image() -> UIImage {
        switch self {
        case .coc:
            return #imageLiteral(resourceName: "coc")
        case .medical:
            return #imageLiteral(resourceName: "medical")
        case .chow:
            return #imageLiteral(resourceName: "chow")
        case .supplies:
            return #imageLiteral(resourceName: "supplies")
        case .bivouac:
            return #imageLiteral(resourceName: "bivouac")
        case .motorPool:
            return #imageLiteral(resourceName: "motorPool")
        case .fuel:
            return #imageLiteral(resourceName: "fuel")
        }
    }
}

class LegendAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: LegendType
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, type: LegendType) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}
