//
//  LayersViewController.swift
//  iScout
//
//  Created by David Mercado on 4/7/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import UIKit

enum MapLayersType: Int {
    case mapRoute
    case mapCocLocation
    case mapMedicalLocation
    case mapChowLocation
    case mapSuppliesLocation
    case mapBivouacLocation
    case mapMotorPoolLocation
    case mapFuelLocation
    //case mapBoundary = 0
    //case mapOverlay
    
    
    
    func displayName() -> String {
        switch (self) {
        case .mapRoute:
            return "Dog Route"
        case .mapCocLocation:
            return "COC"
        case .mapMedicalLocation:
            return "First Aid"
        case .mapChowLocation:
            return "Chow"
        case .mapSuppliesLocation:
            return "Supplies"
        case .mapBivouacLocation:
            return "Bivouac"
        case .mapMotorPoolLocation:
            return "Motor Pool"
        case .mapFuelLocation:
            return "Fuel"
            
        //case .mapBoundary:
          //  return "Park Boundary"
        //case .mapOverlay:
          //  return "Map Overlay"
        
        
        
        }
    }
}

class MapLayersViewController: UIViewController {
    
    var selectedOptions = [MapLayersType]()
}

// MARK: - UITableViewDataSource
extension MapLayersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell")!
        
        if let mapOptionsType = MapLayersType(rawValue: indexPath.row) {
            cell.textLabel!.text = mapOptionsType.displayName()
            cell.accessoryType = selectedOptions.contains(mapOptionsType) ? .checkmark : .none
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MapLayersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        guard let mapLayersType = MapLayersType(rawValue: indexPath.row) else { return }
        
        if (cell.accessoryType == .checkmark) {
            // Remove option
            selectedOptions = selectedOptions.filter { $0 != mapLayersType}
            cell.accessoryType = .none
        } else {
            // Add option
            selectedOptions += [mapLayersType]
            cell.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
