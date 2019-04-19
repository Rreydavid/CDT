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
    
    //------------------------------------------------------------------------------------------
    // MARK: - Add Map Layer
    //TODO: Combine all of these into one fuction with a switch statement
    //where a parameter property list name is passed in
    //display the dog route layer from the proptery list
    func addRoute() {
        guard let points = Lexington.plist("Route") as? [String] else { return }
        
        let cgPoints = points.map { NSCoder.cgPoint(for: $0) }
        let coords = cgPoints.map { CLLocationCoordinate2DMake(CLLocationDegrees($0.x), CLLocationDegrees($0.y)) }
        let myPolyline = MKPolyline(coordinates: coords, count: coords.count)
        
        mapView.addOverlay(myPolyline)
    }
    //display COC layer from the proptery list
    func addCocPin() {
        guard let layers = Lexington.plist("COC") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .coc
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    //display medical layer from the proptery list
    func addMedicalPin() {
        guard let layers = Lexington.plist("Medical") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .medical
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    //display chow layer from the proptery list
    func addChowPin() {
        guard let layers = Lexington.plist("Chow") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .chow
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    //display supplies layer from the proptery list
    func addSuppliesPin() {
        guard let layers = Lexington.plist("Supplies") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .supplies
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    //display Bivoauc layer from the proptery list
    func addBivouacPin() {
        guard let layers = Lexington.plist("Bivouac") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .bivouac
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    //display Motor pool layer from the proptery list
    func addMotorPoolPin() {
        guard let layers = Lexington.plist("MotorPool") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .motorPool
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    //display fuel layer from the proptery list
    func addFuelPin() {
        guard let layers = Lexington.plist("Fuel") as? [[String : String]] else { return }
        
        for layer in layers {
            let coordinate = Lexington.parseCoord(dict: layer, fieldName: "location")
            let title = layer["name"] ?? ""
            let typeRawValue = Int(layer["type"] ?? "0") ?? 0
            let type = LegendType(rawValue: typeRawValue) ?? .fuel
            let subtitle = layer["subtitle"] ?? ""
            let annotation = LegendAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    //------------------------------------------------------------------------------------------
    //TODO: future iterations display a boundry around the base camp as well as add markers (pins)
    /*func addOverlay() {
        let overlay = MapOverlay(area: lexington)
        mapView.addOverlay(overlay)
    }
    func addBoundary() {
        mapView.addOverlay(MKPolygon(coordinates: lexington.boundary, count: lexington.boundary.count))
    }
    
    func addCharacterLocation() {
        mapView.addOverlay(Character(filename: "MedicalLocation", color: .red))
        //mapView.addOverlay(Character(filename: "BLocations", color: .blue))
        //mapView.addOverlay(Character(filename: "TLocations", color: .orange))
    }
    */
    
    //------------------------------------------------------------------------------------------
    // MARK: Helper methods
    func loadSelectedLayers() {
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        
        //used to decide which layer to add
        for option in selectedOptions {
            switch (option) {
            case .mapRoute:
                self.addRoute()
            case .mapCocLocation:
                self.addCocPin()
            case .mapMedicalLocation:
                self.addMedicalPin()
            case .mapChowLocation:
                self.addChowPin()
            case .mapSuppliesLocation:
                self.addSuppliesPin()
            case .mapBivouacLocation:
                self.addBivouacPin()
            case .mapMotorPoolLocation:
                self.addMotorPoolPin()
            case .mapFuelLocation:
                self.addFuelPin()
                
            /*case .mapOverlay:
                self.addOverlay()
            case .mapBoundary:
                self.addBoundary()
            */
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

//------------------------------------------------------------------------------------------
// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    //function used to decide to either draw a route, polygon (for boundry), or a marker (pin)
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
}
