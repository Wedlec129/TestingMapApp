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
    
    //sekor map
    @Published var size:Double = 0.04 {
        didSet {
            if size > 0 {
                mapSpan = MKCoordinateSpan(latitudeDelta: size, longitudeDelta: size)
                updateMapRegion(location: mapLocation)
            }
        }
    }
    
    
    // Current location on map
    @Published var mapLocation: ModelLocation! {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var  mapSpan :MKCoordinateSpan!
    
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    init(){
        fetchLocation()
       
        mapSpan = MKCoordinateSpan(latitudeDelta: size, longitudeDelta: size)
        
        self.mapLocation = self.locations.first!
        self.updateMapRegion(location: locations.first!)
        
    }
    
    //типо получаем данные (потом можно парсить json)
    func fetchLocation(){
        
        
        locations.append(ModelLocation(nameLocation: "Аня", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), image: "anna", dataLast: "02.07.2017", timeLast: "14:00", volumeSignal: .good))
        
        locations.append(ModelLocation(nameLocation: "Давид", coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769), image: "david", dataLast: "06.07.2017", timeLast: "18:00", volumeSignal: .norm))
        
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



//get my location
final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    @Published var region = MKCoordinateRegion (center: CLLocationCoordinate2D (latitude: 40,longitude: 120),
                                                span: MKCoordinateSpan (latitudeDelta: 100, longitudeDelta: 100))
    let locationManger = CLLocationManager()
    
    @Published var coordinate :CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManger.delegate = self
    }
    
    
    func requestAllowOnceLocationPermission() {
        locationManger.requestLocation()
    }
    func locationManager (_ manager: CLLocationManager, didUpdateLocations locations:  [CLLocation]) {
        guard let latestLocation = locations.first else {
            //error
            return
            
        }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion (center: latestLocation.coordinate, span:
                                                MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            print(latestLocation.coordinate)
            self.coordinate = latestLocation.coordinate
           
            
        }
    }
    
    
    func locationManager (_ manager: CLLocationManager, didFailWithError error: Error) {
        print (error.localizedDescription)
    }
}
    
    
