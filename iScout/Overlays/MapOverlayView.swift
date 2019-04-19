//
//  MapOverlayView.swift
//  iScout
//
//  Created by   on 4/2/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import UIKit
import MapKit

class MapOverlayView: MKOverlayRenderer {
    var overlayImage: UIImage
    
    //used to overlay images onto the map
    init(overlay:MKOverlay, overlayImage:UIImage) {
        self.overlayImage = overlayImage
        super.init(overlay: overlay)
    }
    
    //function used to actually drae the map and be able to zoom on lexington
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        guard let imageReference = overlayImage.cgImage else { return }
        
        let rect = self.rect(for: overlay.boundingMapRect)
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -rect.size.height)
        context.draw(imageReference, in: rect)
    }
}

