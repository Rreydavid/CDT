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
            return #imageLiteral(resourceName: "star")
        case .medical:
            return #imageLiteral(resourceName: "ride")
        case .chow:
            return #imageLiteral(resourceName: "food")
        case .supplies:
            return #imageLiteral(resourceName: "firstaid")
        case .bivouac:
            return #imageLiteral(resourceName: "star")
        case .motorPool:
            return #imageLiteral(resourceName: "ride")
        case .fuel:
            return #imageLiteral(resourceName: "food")
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
