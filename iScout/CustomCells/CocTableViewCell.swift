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
    
    //when 'set GPS' button is pressed update lat and long data on cell
    @IBAction func setGPS(_ sender: UIButton) {
        labelLat?.text = latStr
        labelLong?.text = longStr
    }
    
    //initalized location services and keep constantly updating
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
    
    //used to get actual lat and long values then set them into a global variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print("location = \(locValue.latitude) \(locValue.longitude)")
        
        var dLat = Double(locValue.latitude).rounded(toPlaces: 5)
        var dLong = Double(locValue.longitude).rounded(toPlaces: 5)
        
        latStr = String(dLat)
        longStr = String(dLong)
        print("lat: \(latStr)")
        print("lat: \(longStr)")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

//used to set number of percision for lat and long data
extension Double{
    func rounded(toPlaces places: Int) -> Double{
        let divisor = pow(10.0, Double(places))
        return(self * divisor).rounded() / divisor
    }
}
