//
//  CocTableViewCell.swift
//  iScout
//
//  Created by David Mercado on 3/18/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class CocTableViewCell : UITableViewCell, CLLocationManagerDelegate{
    
    @IBOutlet weak var labelMain: UILabel!
    @IBOutlet weak var labelLat: UILabel!
    @IBOutlet weak var labelLong: UILabel!
    @IBOutlet weak var buttonSetGPS: UIButton!

    let locationManager = CLLocationManager()
    var latStr : String = ""
    var longStr : String = ""
    
    @IBAction func setGPS(_ sender: UIButton) {
        labelLat?.text = latStr
        labelLong?.text = longStr
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print("location = \(locValue.latitude) \(locValue.longitude)")
        
        latStr = String(locValue.latitude)
        longStr = String(locValue.longitude)
        print("lat: \(latStr)")
        print("lat: \(longStr)")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
