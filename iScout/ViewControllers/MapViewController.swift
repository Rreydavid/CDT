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
    
    @IBOutlet weak var mapView: MKMapView!
    
    var lexington = Lexington(filename: "Lexington")
    var selectedOptions : [MapLayersType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latDelta = lexington.overlayTopLeftCoordinate.latitude -
            lexington.overlayBottomRightCoordinate.latitude
        
        // Think of a span as a tv size, measure from one corner to another
        let span = MKCoordinateSpan(latitudeDelta: fabs(latDelta), longitudeDelta: 0.0)
        let region = MKCoordinateRegion(center: lexington.midCoordinate, span: span)
        
        mapView.region = region
    }

    // MARK: - Add methods
    func addOverlay() {
        let overlay = MapOverlay(area: lexington)
        mapView.addOverlay(overlay)
    }
    
    func addLayersPins() {
        guard let layers = Lexington.plist("COCLayers") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .misc
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    
    func addRoute() {
     guard let points = Lexington.plist("Places") as? [String] else { return }
     
     let cgPoints = points.map { NSCoder.cgPoint(for: $0) }
     let coords = cgPoints.map { CLLocationCoordinate2DMake(CLLocationDegrees($0.x), CLLocationDegrees($0.y)) }
     let myPolyline = MKPolyline(coordinates: coords, count: coords.count)
     
     mapView.addOverlay(myPolyline)
     }
    
    func addBoundary() {
        mapView.addOverlay(MKPolygon(coordinates: lexington.boundary, count: lexington.boundary.count))
    }
    
    func addCharacterLocation() {
        mapView.addOverlay(Character(filename: "BatmanLocations", color: .blue))
        mapView.addOverlay(Character(filename: "TazLocations", color: .orange))
        mapView.addOverlay(Character(filename: "TweetyBirdLocations", color: .yellow))
    }
    
    
    // MARK: Helper methods
    func loadSelectedLayers() {
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        
        for option in selectedOptions {
            switch (option) {
            case .mapOverlay:
                self.addOverlay()
            case .mapPins:
                self.addLayersPins()
            case .mapRoute:
                self.addRoute()
            case .mapBoundary:
                self.addBoundary()
            case .mapCharacterLocation:
                self.addCharacterLocation()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? MapLayersViewController)?.selectedOptions = selectedOptions
    }

    @IBAction func closeOptions(_ exitSegue: UIStoryboardSegue) {
        guard let vc = exitSegue.source as? MapLayersViewController else { return }
        selectedOptions = vc.selectedOptions
        loadSelectedLayers()
    }
    
        @IBAction func mapTypeChange(_ sender: UISegmentedControl) {
            mapView.mapType = MKMapType.init(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard
        }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MapOverlay {
            return MapOverlayView(overlay: overlay, overlayImage: #imageLiteral(resourceName: "overlay_park"))
        } else if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = UIColor.green
            return lineView
        } else if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.strokeColor = UIColor.magenta
            return polygonView
        } else if let character = overlay as? Character {
            let circleView = MKCircleRenderer(overlay: character)
            circleView.strokeColor = character.color
            return circleView
        }
        
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let legendView = LegendAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        legendView.canShowCallout = true
        return legendView
    }
    
    
    /*
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        
        return MKOverlayRenderer()
    }*/
}
