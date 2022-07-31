//
//  LocationsViewModel.swift
//  LearnMapKit
//
//  Created by Adarsh Shukla on 31/07/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    //All loaded locations on the map.
    @Published var locations: [Location]
    
    //Current Location on the map.
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    //current region on the map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //show list of locations.
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: locations.first!)
    }
    
    func updateMapRegion(location: Location) {
        withAnimation {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(Animation.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(Animation.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}
