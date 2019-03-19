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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func mapTypeChange(_ sender: UISegmentedControl) {
        MapView.mapType = MKMapType.init(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard
    }
    
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
}
