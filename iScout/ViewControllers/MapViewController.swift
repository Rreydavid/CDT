//
//  ViewController.swift
//  iScout
//
//  Created by David Mercado on 2/1/19.
//  Copyright © 2019 CDT. All rights reserved.
//
// This is based off the tutorial by Ray Wenderlich
// https://www.raywenderlich.com/425-mapkit-tutorial-overlay-views

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var MapView: MKMapView!
    
    //var park = Park(filename: "Places")
    //var selectedOptions : [MapOptionsType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func mapTypeChange(_ sender: UISegmentedControl) {
        MapView.mapType = MKMapType.init(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard
    }
    
    /*func addRoute() {
        guard let points = Park.plist("Places") as? [String] else { return }
        
        let cgPoints = points.map { NSCoder.cgPoint(for: $0) }
        let coords = cgPoints.map { CLLocationCoordinate2DMake(CLLocationDegrees($0.x), CLLocationDegrees($0.y)) }
        let myPolyline = MKPolyline(coordinates: coords, count: coords.count)
        
        MapView.addOverlay(myPolyline)
    }*/
    
    // MARK: Helper methods
    func loadSelectedOptions() {
        MapView.removeAnnotations(MapView.annotations)
        MapView.removeOverlays(MapView.overlays)
        
        /*for option in selectedOptions {
            switch (option) {
            case .mapOverlay:
                self.addOverlay()
            case .mapPins:
                self.addAttractionPins()
            case .mapRoute:
                self.addRoute()
            case .mapBoundary:
                self.addBoundary()
            case .mapCharacterLocation:
                self.addCharacterLocation()
            }
        }*/
    }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        
        return MKOverlayRenderer()
    }
}
