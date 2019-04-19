//
//  LegendAnnotationView.swift
//  iScout
//
//  Created by David Mercado on 4/7/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import UIKit
import MapKit

class LegendAnnotationView: MKAnnotationView {
    
    // Required for MKAnnotationView
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //used to be able to call the specific layer(s) and get their respected images
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        guard let legendAnnotation = self.annotation as? LegendAnnotation else { return }
        
        image = legendAnnotation.type.image()
    }
}
