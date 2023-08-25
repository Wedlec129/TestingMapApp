//
//  ViewModelLocation.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//

import SwiftUI
import MapKit
import Foundation

class ViewModelLocation: ObservableObject {
    
    //all loadet location
    @Published var locations: [ModelLocation] = []
    
    
    // Current location on map
    @Published var mapLocation: ModelLocation! {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    init(){
        fetchLocation()
        
        
        self.mapLocation = self.locations.first!
        self.updateMapRegion(location: locations.first!)
        
    }
    
    //типо получаем данные (потом можно парсить json)
    func fetchLocation(){
        locations.append(ModelLocation(nameLocation: "Аня", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), image: "anna", dataLast: 2, timeLast: 44, volumeSignal: 100))
        
        locations.append(ModelLocation(nameLocation: "Давид", coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769), image: "david", dataLast: 21, timeLast: 14, volumeSignal: 90))
        
    }
    
    
    private func updateMapRegion(location: ModelLocation) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
   
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
//            showLocationsList = !showLocationsList
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: ModelLocation) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index IS valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}

